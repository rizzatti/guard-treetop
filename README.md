# Guard::Treetop
[![Build Status][travis-badge]][travis-site]
[![Dependency Status][gemnasium-badge]][gemnasium-site]
[![Code Climate][cc-badge]][cc-site]

Guard::Treetop compiles your treetop grammars to ruby files using guard.

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

And edit your `Guardfile`.

## Options

```ruby
:input => 'grammars'          # Relative path to the root directory.
                              # Will compile .tt and .treetop files inside
                              # default: nil

:output => 'lib/parsers'      # Relative path to the root directory.
                              # default: the same as :input

:all_on_start => false        # Run compilation when guard starts
                              # default: false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[cc-badge]: https://codeclimate.com/badge.png
[cc-site]: https://codeclimate.com/github/zehrizzatti/guard-treetop
[gemnasium-badge]: https://gemnasium.com/zehrizzatti/guard-treetop.png
[gemnasium-site]: https://gemnasium.com/zehrizzatti/guard-treetop
[travis-badge]: https://travis-ci.org/zehrizzatti/guard-treetop.png
[travis-site]: https://travis-ci.org/zehrizzatti/guard-treetop
