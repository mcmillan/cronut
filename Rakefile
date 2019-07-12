# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task :generate_drone_yml do
  sh 'jsonnet -y .drone.jsonnet > .drone.yml'
end
