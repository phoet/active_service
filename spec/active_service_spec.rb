require 'spec_helper'

module ActiveService
  describe ActiveService do
    before do
    end

    context "configuration" do
      it "should fail without secret and key" do
        "".should be_nil
      end
    end
  end
end
