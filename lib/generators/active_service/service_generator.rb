module ActiveService
  module Generators
    class ServiceGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an ActiveService class."
      class_option :service

      def create_service
        create_file "app/services/#{file_name}_service.rb", <<-FILE
class #{file_name.camelize}Service < ActiveService::Base
  # your service methods
end
        FILE
      end
    end
  end
end