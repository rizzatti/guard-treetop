# Guard::Treetop

Guard::Treetop compiles your treetop grammars to ruby files.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'guard-treetop'
end
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install guard-treetop
```

## Usage

```bash
$ bundle exec guard init treetop
```

## Options

```ruby
:input => 'grammars'          # Relative path to the root directory.
                              # Will compile .tt and .treetop files inside
                              # default: nil

:output => 'lib/parsers'      # Relative path to the root directory.
                              # default: the same as :input
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
