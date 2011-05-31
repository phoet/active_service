require 'spec_helper'

module ActiveService
  describe ActiveService do

    context "method extension" do
      it "blaaa" do
        ActionController::Base.respond_to?(:service).should be_true
      end
    end

    context "class services" do

      class TestController < ActionController::Base
        service :nups, :dups, :wups
      end

      before do
        @controller = TestController.new
      end

      it "should have services set" do
        @controller.__active_services.should eql([:nups, :dups, :wups])
      end
      
      it "should get a service" do
        @controller.service(:nups).should eql('blupp')
      end
    end
  end
end
