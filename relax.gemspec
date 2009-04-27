# -*- encoding: utf-8 -*-

spec = Gem::Specification.new do |s|
  s.name = %q{relax}
  s.version = %q{0.0.7.1}
  s.date = %q{2009-03-03}
  s.summary = %q{AWS FPS Ruby API}
  s.description = %{A simple library for creating REST consumers.}
  s.files = ["lib/relax/parsers/base.rb", "lib/relax/parsers/factory.rb", "lib/relax/parsers/hpricot.rb", "lib/relax/parsers/rexml.rb", "lib/relax/parsers.rb", "lib/relax/query.rb", "lib/relax/request.rb", "lib/relax/response.rb", "lib/relax/service.rb", "lib/relax/symbolic_hash.rb", "lib/relax.rb", "spec/parser_helper.rb", "spec/parsers/factory_spec.rb", "spec/parsers/hpricot_spec.rb", "spec/parsers/rexml_spec.rb", "spec/query_spec.rb", "spec/request_spec.rb", "spec/response_spec.rb", "spec/spec_helper.rb", "spec/symbolic_hash_spec.rb"]
  s.require_paths = ["lib"]
  s.has_rdoc = false
  s.author = %q{Tyler Hunt}
  s.homepage = %q{http://github.com/tylerhunt/relax/tree/master}
  s.rubygems_version = %q{1.3.0}
end
