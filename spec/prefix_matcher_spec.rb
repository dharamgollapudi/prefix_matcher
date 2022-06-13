# frozen_string_literal: true

require 'tempfile'

RSpec.describe PrefixMatcher do
  it 'has a version number' do
    expect(PrefixMatcher::VERSION).not_to be_nil
  end

  describe '#match' do
    shared_examples 'common use cases' do
      context 'when there are no matches' do
        it 'returns an empty array' do
          expect(matcher.match('z')).to eq []
        end
      end

      context 'when there are matches' do
        it 'returns matched words' do
          expect(matcher.match('f')).to eq(['foo'])
        end

        it 'includes the word prefixed by prefix' do
          expect(matcher.match('f')).to include('foo')
        end

        it 'does not include the word NOT prefixed by prefix' do
          expect(matcher.match('f')).not_to include('bar')
        end
      end
    end

    describe '.from_file' do
      let(:test_file) do
        Tempfile.new('words').tap do |file|
          %w[foo bar baz].each do |word|
            file.puts(word)
          end

          file.close
        end
      end
      let(:matcher) { described_class.from_file(test_file.path) }

      after { test_file.unlink }

      include_examples 'common use cases'
    end

    describe '.from_words' do
      let(:matcher) { described_class.from_words(%w[foo bar baz]) }

      include_examples 'common use cases'
    end

    context 'when manually adding' do
      let(:matcher) do
        matcher = described_class.new
        %w[foo bar baz].each do |word|
          matcher.add_word(word)
        end
        matcher
      end

      include_examples 'common use cases'
    end
  end

  describe '#contains' do
    shared_examples 'common use cases' do
      context 'when does NOT contain' do
        it 'returns false' do
          expect(matcher.contains?('z')).to be false
        end
      end

      context 'when does contain' do
        it 'returns true' do
          expect(matcher.contains?('foo')).to be true
        end
      end
    end

    describe '.from_file' do
      let(:test_file) do
        Tempfile.new('words').tap do |file|
          %w[foo bar baz].each do |word|
            file.puts(word)
          end

          file.close
        end
      end
      let(:matcher) { described_class.from_file(test_file.path) }

      after { test_file.unlink }

      include_examples 'common use cases'
    end

    describe '.from_words' do
      let(:matcher) { described_class.from_words(%w[foo bar baz]) }

      include_examples 'common use cases'
    end

    context 'when manually adding' do
      let(:matcher) do
        matcher = described_class.new
        %w[foo bar baz].each do |word|
          matcher.add_word(word)
        end
        matcher
      end

      include_examples 'common use cases'
    end
  end
end
