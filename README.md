# Guard::Treetop

[![Gem Version](badge-fury-badge)](badge-fury-site)
[![Build Status][travis-badge]][travis-site]
[![Dependency Status][gemnasium-badge]][gemnasium-site]
[![Code Climate][cc-badge]][cc-site]
[![Coverage Status](coveralls-badge)](coveralls-site)

Compiles your treetop grammars to ruby files using [guard][guard].

Tested under MRI 1.8, 1.9 and 2.0, JRuby and Rubinius.

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

Or install it yourself:

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

[badge-fury-badge]: https://badge.fury.io/rb/guard-treetop.png
[badge-fury-site]: http://badge.fury.io/rb/guard-treetop
[cc-badge]: https://codeclimate.com/badge.png
[cc-site]: https://codeclimate.com/github/rizzatti/guard-treetop
[coveralls-badge]: https://coveralls.io/repos/rizzatti/guard-treetop/badge.png?branch=master
[coveralls-site]: https://coveralls.io/r/rizzatti/guard-treetop
[gemnasium-badge]: https://gemnasium.com/rizzatti/guard-treetop.png
[gemnasium-site]: https://gemnasium.com/rizzatti/guard-treetop
[guard]: https://github.com/guard/guard
[travis-badge]: https://travis-ci.org/rizzatti/guard-treetop.png
[travis-site]: https://travis-ci.org/rizzatti/guard-treetop
