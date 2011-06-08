require "bundler"
require "rdoc/task"
require "rspec/core/rake_task"
require 'active_record'
require 'yaml'
require 'logger'

Bundler::GemHelper.install_tasks

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migration.verbose = true
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.logger = Logger.new(File.open('db/database.log', 'a'))
  ActiveRecord::Base.establish_connection(YAML::load(File.open('db/database.yml')))
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["--format Fuubar", "--color"]
  t.pattern = 'spec/**/*_spec.rb'
end

RDoc::Task.new do |rd|
  rd.rdoc_files.include(File.readlines('.document').map(&:strip))
  rd.options + ['-a', '--inline-source', '--charset=UTF-8']
end

task :default=>[:migrate, :spec]
