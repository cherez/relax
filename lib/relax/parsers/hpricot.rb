require 'rubygems'
require 'hpricot'

module Relax
  module Parsers
    # Parses the server's raw response using the Hpricot library.
    class Hpricot < Base
      FACTORY_NAME = :hpricot

      def initialize(raw, parent)
        @xml = ::Hpricot.XML(raw)
        super(raw, parent)
      end

      def parse!
        if parameters
          parameters.each do |parameter, options|
            begin
              element = options[:element] || parameter

              node = case
                when options[:attribute] && options[:attribute] == true
                  attribute(root, element)
                when options[:attribute]
                  attribute(element(element), options[:attribute])
                when options[:collection]
                  elements(element)
                else
                  element(element)
              end

              if options[:collection]
                value = node.collect do |element|
                  options[:collection].new(element)
                end
              else
                value = case type = options[:type]
                  when Response
                    type.new(node)
                  when :date
                    date_value(node)
                  when :time
                    time_value(node)
                  when :float
                    float_value(node)
                  when :integer
                    integer_value(node)
                  when :text
                  else
                    text_value(node)
                end
              end

              parent.instance_variable_set("@#{parameter}", value)
            rescue ::Hpricot::Error
              raise Relax::MissingParameter if options[:required]
            end
          end
        end
      end

      # Returns the root of the XML document.
      def root
        @xml.root
      end

      # Checks the name of the root node.
      def is?(name)
        root.name.gsub(/.*:(.*)/, '\1') == node_name(name)
      end

      # Returns a set of elements matching name.
      def elements(name)
        root.search(root_path(name))
      end

      # Returns an element of the specified name.
      def element(name)
        root.at(root_path(name))
      end
      alias :has? :element

      # Returns an attribute on an element.
      def attribute(element, name)
        element[name]
      end

      # Gets the value of an element or attribute.
      def value(value)
        value.is_a?(::Hpricot::Elem) ? value.inner_text : value.to_s
      end

      # Gets a text value.
      def text_value(value)
        value(value)
      end

      # Gets an integer value.
      def integer_value(value)
        value(value).to_i
      end

      # Gets a float value.
      def float_value(value)
        value(value).to_f
      end

      # Gets a date value.
      def date_value(value)
        Date.parse(value(value))
      end

      # Gets a time value.
      def time_value(value)
        if value(value) == ''
          return nil
        end
        Time.parse(value(value))
      end

      # Converts a name to a node name.
      def node_name(name)
        @parent.node_name(name)
      end
      private :node_name

      # Gets the XPath expression representing the root node.
      def root_path(name)
        "/#{node_name(name)}"
      end
      private :root_path
    end

    Factory.register(Hpricot::FACTORY_NAME, Hpricot)
  end
end
