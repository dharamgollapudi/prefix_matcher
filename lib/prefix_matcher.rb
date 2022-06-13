# frozen_string_literal: true

require 'prefix_matcher/version'
require 'prefix_matcher/trie'
require 'prefix_matcher/node'

# PrefixMatcher is a module with helper methods to instantiate a matcher
# that can be later queried against the words that match a specific prefix
module PrefixMatcher
  class Error < StandardError; end

  class << self
    def from_file(words)
      PrefixMatcher::Trie.from_file(words)
    end

    def from_words(words)
      PrefixMatcher::Trie.from_words(words)
    end

    def new
      PrefixMatcher::Trie.new
    end
  end
end
