# -*- encoding: utf-8 -*-
require File.expand_path("../lib/guard/treetop/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zeh Rizzatti"]
  gem.email         = ["zehrizzatti@gmail.com"]
  gem.description   = %q{Guard::Treetop automatically compiles your treetop grammars}
  gem.summary       = %q{Guard gem for Treetop}
  gem.homepage      = "http://rubygems.org/gems/guard-treetop"

  gem.files         = Dir['lib/**/*'] << 'README.md' << 'LICENSE'
  gem.test_files    = Dir['spec/**/*.rb']
  gem.name          = "guard-treetop"
  gem.require_paths = ["lib"]
  gem.version       = Guard::TreetopVersion::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency "guard", "~> 1.2"
  gem.add_dependency "treetop", "~> 1.4.0"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rspec"
end
