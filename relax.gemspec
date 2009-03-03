# -*- encoding: utf-8 -*-

spec = Gem::Specification.new do |s|
  s.name = %q{relax}
  s.version = %q{0.0.7.1}
  s.date = %q{2009-03-03}
  s.summary = %q{AWS FPS Ruby API}
  s.description = %{A simple library for creating REST consumers.}
  s.files = Dir['lib/**/*.rb'] + Dir['spec/**/*.rb']
  s.require_paths = ["lib"]
  s.has_rdoc = false
  s.author = %q{Tyler Hunt}
  s.homepage = %q{http://github.com/tylerhunt/relax/tree/master}
  s.rubygems_version = %q{1.3.0}
end
