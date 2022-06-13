# frozen_string_literal: true

module PrefixMatcher
  # Node is an internal data structure which helps to hold the word prefix and the word in the leaf
  # that can be queried against later for words that match a specific prefix
  class Node
    attr_accessor :children, :word

    def initialize
      @children = {}
      @word = nil
    end

    def add_word(word, prefix)
      character = prefix[0]
      children[character] ||= self.class.new
      child = children[character]

      if prefix.length == 1
        child.assign_word(word)
      else
        child.add_word(word, prefix[1..])
      end
    end

    def match(prefix)
      character = prefix[0]
      child = children[character]

      if prefix.length == 1
        child&.get_words || []
      else
        child&.match(prefix[1..]) || []
      end
    end

    def assign_word(word)
      @word = word
    end

    def get_words(words = [])
      words << word if word

      children.each do |child|
        child[1].get_words(words)
      end

      words
    end

    def contains?(word, prefix)
      return true if @word == word

      character = prefix[0]
      child = children[character]
      child&.contains?(word, prefix[1..]) || false
    end
  end
end
