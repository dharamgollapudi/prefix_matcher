# frozen_string_literal: true

module PrefixMatcher
  # Trie is an internal data structure which helps to holds the words
  # that can be queried against later for words that match a specific prefix
  class Trie
    class << self
      def from_file(file)
        words = File.readlines(file).map { |w| w.chomp.downcase }.uniq
        from_words(words)
      end

      def from_words(words)
        dictionary = new
        words.each do |word|
          dictionary.add_word(word)
        end
        dictionary
      end
    end

    attr_accessor :root

    def initialize
      @root = ::PrefixMatcher::Node.new
    end

    def add_word(word)
      root.add_word(word, word)
    end

    def match(prefix)
      root.match(prefix)
    end

    def contains?(word)
      root.contains?(word, word)
    end
  end
end
