require 'spec_helper'
require "yaml"
require 'fileutils'

module ActiveService
  describe Configuration do
    it "should return defaults" do
      ActiveService::Configuration.path.should eql('app/services')
    end
    
    context "with config-file" do
      before do
        File.open(ActiveService::Configuration::CONFIG_FILE, "w") { |file| YAML.dump({'path' => 'nups'}, file) }
      end
      after do
        FileUtils.rm(ActiveService::Configuration::CONFIG_FILE)
      end
      
      it "should load the yml config" do
        ActiveService::Configuration.path.should eql('nups')
      end
    end
  end
end