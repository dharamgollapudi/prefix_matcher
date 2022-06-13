# frozen_string_literal: true

require_relative 'lib/prefix_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'prefix_matcher'
  spec.version       = PrefixMatcher::VERSION
  spec.authors       = ['Dharam Gollapudi']
  spec.email         = ['dharam.gollapudi@gmail.com']

  spec.summary       = 'PrefixMatcher to find the words that has a prefix match'
  spec.homepage      = 'https://www.github.com/dharamgollapudi/prefix_matcher'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|fixtures|benchmarks)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'benchmark-ips', '~> 2.10'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.30'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.11'
end
