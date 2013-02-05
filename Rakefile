require "bundler/gem_tasks"
require 'rake/testtask'
require 'benchmark'

task :default => [:test]

desc 'Run basic tests'
Rake::TestTask.new do |test|
  test.libs << "test"
  test.test_files = Dir["test/*_test.rb"]
  test.verbose = true
end
