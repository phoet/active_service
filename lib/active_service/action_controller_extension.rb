module ActionService
  module ActionControllerExtension
    
    def service(name)
      self.class.services[name]
    end
    
    def __active_services
      self.class.service_names
    end
    
    module ClassMethods
      
      attr_accessor :services, :service_names
      
      def service(*names)
        @services ||= {}
        @service_names ||= []
        names.each{|name| @services[name] = 'blupp'; @service_names << name }
      end
    end
  end
end
