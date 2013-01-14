source 'https://rubygems.org'

gemspec

group :development do
  gem 'awesome_print'
  gem 'pry'
  gem 'travis-lint'
  gem 'rb-inotify', '~> 0.8.8' if RUBY_PLATFORM =~ /linux/
end

group :test do
  gem 'guard-rspec'
  gem 'rake'
end
