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
  def self.match(prefix, words)
    words.select { |word| word.start_with? prefix }
  end
end

Benchmark.ips do |x|
  x.report('using array select') do
    UsingRubyAPI.match('do', words)
  end

  x.report('using prefix matcher') do
    matcher.match('do')
  end

  x.compare!
end
