#!/usr/bin/env rake
require "rake/testtask"
require "sinatra/activerecord/rake"

task :default => :test

namespace :db do
  task :load_config do
    require "./app/sinatra_skeleton"
  end
end

Rake::TestTask.new do |t|
  t.libs << "."
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

