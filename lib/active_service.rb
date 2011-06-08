require 'rails'
require 'active_service/version'
require 'active_service/configuration'
require 'active_service/base'
require 'active_service/action_controller_extension'
require 'active_service/core_ext/action_controller/base'

module ActiveService
  module Rails
    class Railtie < ::Rails::Railtie
      config.after_initialize do |app|
        ::Rails.logger.info "adding #{ActiveService::Configuration.path} to autoload_path"
        app.config.autoload_paths = [ActiveService::Configuration.path] + app.config.autoload_paths
      end
    end
  end
end