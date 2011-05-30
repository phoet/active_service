$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')
require 'rspec'
require 'active_service'
require 'pp'

RSpec.configure do |c|
  c.mock_with :rspec
end
