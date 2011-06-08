module ActiveService
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an ActiveService initializer."
      class_option :service

      def copy_initializer
        copy_file "initializer.rb", "config/initializers/active_service.rb"
      end
    end
  end
end