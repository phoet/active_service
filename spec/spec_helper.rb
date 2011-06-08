require 'rspec'
require 'active_service'

# load test-data
require 'user'
dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

RSpec.configure do |c|
  c.mock_with :rspec
end

# test classes
class NupsService < ActiveService::Base
  def some_method
    "some_value"
  end
  def with_params(muschi, sushi)
    "#{muschi} #{sushi}"
  end
  def with_block(*params)
    "#{params.inspect}_#{yield}"
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