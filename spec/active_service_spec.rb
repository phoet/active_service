require 'spec_helper'

class NupsService < ActiveService::Base
  def testo
    "pesto"
  end
  def uschi(muschi, sushi)
    "#{muschi} #{sushi}"
  end
end
class DupsService < ActiveService::Base; end
class WupsService < ActiveService::Base; end

class TestController < ActionController::Base
  service :nups, :dups, :wups
end

module ActiveService
  describe ActiveService do

    context "method extension" do
      it "blaaa" do
        ActionController::Base.respond_to?(:service).should be_true
      end
    end

    context "class services" do
      before do
        @controller = TestController.new
        @service    = @controller.service(:nups)
      end

      it "should have services set" do
        @controller.__active_services.should eql([:nups, :dups, :wups])
      end

      it "should get a service" do
        @service.should be_an_instance_of(NupsService)
      end
      
      it "should have a proxy-method" do
        @service.respond_to?(:__testo).should be_true
      end
      
      it "should have a no transactional-method" do
        @service.respond_to?(:testo!).should be_true
      end
      
      it "should call the original method as expected" do
        @service.testo.should eql('pesto')
      end
      
      it "should fail with wrong arity" do
        lambda {@service.testo('bad_param')}.should raise_error
      end
      
      it "should handle arity right" do
        @service.uschi('a', 'b').should eql('a b')
      end
    end
  end
end
