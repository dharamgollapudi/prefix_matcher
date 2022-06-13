# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
RSpec::Core::RakeTask.new(:spec)

# RuboCop::RakeTask.new(:rubocop) do |t|
#   t.options = ['--display-cop-names']
# end

task default: :spec

desc 'Run benchmarks'
task :benchmark do
  FileList['benchmark/**/*.rb'].each { |file| ruby file }
end
