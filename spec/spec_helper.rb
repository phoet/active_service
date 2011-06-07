$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')
require 'rspec'
require 'active_service'
require 'pp'
require 'user'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

RSpec.configure do |c|
  c.mock_with :rspec
end

class NupsService < ActiveService::Base
  def testo
    "pesto"
  end
  def uschi(muschi, sushi)
    "#{muschi} #{sushi}"
  end
  def transactional_stuff
    User.create! :name => 'muschi'
    User.create! :name => 'uschi'
  end
end

class DupsService < ActiveService::Base; end

class WupsService < ActiveService::Base; end

class TestController < ActionController::Base
  service :nups, :dups, :wups
end