module ActionService
  module ActionControllerExtension

    extend ActiveSupport::Concern

    module InstanceMethods
      
      def service(name)
        __active_service(name)
      end
      
      protected()
      
      def __active_service(name)
        name = "#{name}_service".to_sym
        raise "#{name} not found! use one of those: #{__active_services.keys.join(', ')}" unless __active_services.has_key?(name)
        __active_services[name]
      end
      
      def __active_services
        return env['__active_services'] if env['__active_services']
        env['__active_services'] = {}
        Dir[Rails.root.join('app', 'services', '*_service.rb')].each do |file|
          name = File.basename(file, '.rb')
          env['__active_services'][name.to_sym] = name.camelize.constantize.new(self)
        end
        env['__active_services']
      end
    end
  end
end
