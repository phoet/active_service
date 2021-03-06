require 'spec_helper'

module ActiveService
  describe ActiveService do

    context "class services" do
      let(:controller) { TestController.new }
      let(:service) { controller.service(:nups) }
      
      before(:each) do
        controller.stub({:__active_services => {:nups_service => NupsService.new(controller)} })
      end

      it "should get a service" do
        service.should be_an_instance_of(NupsService)
      end

      it "should have a proxy-method" do
        service.respond_to?(:__some_method).should be_true
      end

      it "should have a no transactional-method" do
        service.respond_to?(:some_method!).should be_true
      end

      it "should call the original method as expected" do
        service.some_method.should eql('some_value')
      end

      it "should fail with wrong arity" do
        lambda {service.testo('bad_param')}.should raise_error
      end

      it "should handle arity right" do
        service.with_params('a', 'b').should eql('a b')
      end

      it "should handle blocks" do
        service.with_block('a', 'b'){ "nups" }.should eql('["a", "b"]_nups')
      end

      context "transaction with user" do
        before do
          User.delete_all
          user = User.create! :name => 'uschi'
          user.should eql(User.last)
        end

        it "should raise an unique error" do
          lambda {User.create! :name => 'uschi'}.should raise_error
        end

        it "should not commit the transaction on error" do
          expect do
            begin
              service.transactional_stuff
            rescue
              $!.to_s.should eql('Validation failed: Name has already been taken')
            end
          end.to change(User, :count).by(0)
        end

        it "should commit the transaction on error" do
          expect do
            begin
              service.__transactional_stuff
            rescue
              $!.to_s.should eql('Validation failed: Name has already been taken')
            end
          end.to change(User, :count).by(1)
        end

      end
    end
  end
end
