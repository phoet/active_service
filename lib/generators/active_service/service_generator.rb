module ActiveService
  module Generators
    class ServiceGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an ActiveService class."
      class_option :service

      def copy_initializer
        create_file "#{ActiveService::Configuration.path}/#{file_name}_service.rb", <<-FILE
class #{file_name.camelize}Service
  # your service methods
end
        FILE
      end
    end
  end
end