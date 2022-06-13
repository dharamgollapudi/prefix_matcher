# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/../../lib")

require 'benchmark/ips'
require 'prefix_matcher'

words_file = File.expand_path("#{File.dirname(__FILE__)}/../../fixtures/words.txt")
words = File.readlines(words_file).map { |w| w.chomp.downcase }.uniq
matcher = PrefixMatcher.from_words(words)

# UsingRubyAPI is a wrapper to match that of the matcher implementation
# but using straight up ruby implementation for benchmarking
module UsingRubyAPI
  def self.contains?(word, words)
    words.include? word
  end
end

Benchmark.ips do |x|
  x.report('using array include') do
    UsingRubyAPI.contains?('dog', words)
  end

  x.report('using prefix matcher') do
    matcher.contains?('dog')
  end

  x.compare!
end
