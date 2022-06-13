# PrefixMatcher

PrefixMatcher is a module with helper methods to instantiate a matcher from a file full words separated by a new line, 
array of words or manually adding them that can later be queried against for a match of specific prefix. 

For an arbitrarily high number of (n) words and searching for a prefix of (m) length, this is substantially performant 
compared to Array#start_with? which has an O(n) time complexity for the need to check each and every word, while 
PrefixMatcher utilizing a prefix tree (also known as a Trie) is used to optimize the search complexity to O(m).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prefix_matcher'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prefix_matcher

## Usage

For instantiating a matcher from an existing file full of words separated by a new line:

```ruby
require 'prefix_matcher'

matcher = PrefixMatcher.from_file('path_to_file')
matcher.match('foo') # => ['foo']
```

For instantiating a matcher from an array of words:

```ruby
require 'prefix_matcher'

words = %w(foo bar baz)
matcher = PrefixMatcher.from_words(words)
matcher.match('foo') # => ['foo']
```

For instantiating a bare matcher and manually adding the words:

```ruby
require 'prefix_matcher'

matcher = PrefixMatcher.new
%w(foo bar baz).each { |word| matcher.add_word(word)}
matcher.match('foo') # => ['foo']
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Linting

Linting is done using [rubocop](https://github.com/rubocop/rubocop) and the corresponding baseline configuration is setup in `.rubocop.yml`, which can be run using:

    $ bundle exec rake rubocop

### Testing

Testing is done using [RSpec](https://rspec.info/) and all the corresponding tests are located at `spec/*` directory, which can be run using:

    $ bundle exec rake spec

### Benchmarking

Benchmarking is done using [benchmark-ips](https://github.com/evanphx/benchmark-ips) and are located at `benchmark/*` directory, which can be run using:


    $ bundle exec rake benchmark


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dharamgollapudi/prefix_matcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/prefix_matcher/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PrefixMatcher project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/prefix_matcher/blob/master/CODE_OF_CONDUCT.md).
