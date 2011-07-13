module ActiveService
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an ActiveService configuration."
      class_option :service

      def create_config
        create_file "config/active_service.yml", <<-FILE
path: "lib/services"
        FILE
      end
    end
  end
end