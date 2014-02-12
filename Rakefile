require "bundler/gem_tasks"

desc "Open a pry session preloaded with this library"
task :console do
  require 'pry'
  require 'hr'
  ARGV.clear
  Pry.start
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
