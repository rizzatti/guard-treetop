# encoding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/treetop/version'

Gem::Specification.new do |gem|
  gem.name          = 'guard-treetop'
  gem.version       = Guard::TreetopVersion::VERSION
  gem.authors       = ['José Otávio Rizzatti']
  gem.email         = ['zehrizzatti@gmail.com']
  gem.description   = %q{Guard::Treetop automatically compiles your treetop grammars}
  gem.summary       = %q{Guard gem for Treetop}
  gem.homepage      = 'https://github.org/rizzatti/guard-treetop'
  gem.files         = Dir['{lib,spec}/**/*.rb', 'README.md', 'LICENSE.txt']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.license       = 'MIT'
  gem.platform      = Gem::Platform::RUBY

  gem.add_runtime_dependency 'guard', '~> 1.2'
  gem.add_runtime_dependency 'treetop', '~> 1.4.0'
end
