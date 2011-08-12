module ActiveService
  class Base

    delegate :params, :to => '@_current_controller'
    
    def initialize(controller)
      @_current_controller = controller
    end
    
    def service(name)
      __active_services[name]
    end

    def self.method_added(method)
      name = method.to_s
      return if name =~ /__.*/ || name =~ /.*!/
      return if (@__handled_names ||= []).include?(method)
      @__handled_names << method

      alias_method :"__#{name}", method
      alias_method :"#{name}!", method

      define_method(method) { |*args, &block| ::ActiveRecord::Base.transaction { self.method(:"__#{name}").call(*args, &block) } }
    end
  end
end
