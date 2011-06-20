require 'rails'
require 'active_service/version'
require 'active_service/configuration'
require 'active_service/base'
require 'active_service/action_controller_extension'
require 'active_service/core_ext/action_controller/base'
require "yaml"

module ActiveService
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do |app|
        app.config.autoload_paths << ActiveService::Configuration.path
      end
    end
  end
end