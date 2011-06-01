module ActiveService
  class Base
    def self.method_added(method)
      name = method.to_s
      return if name =~ /__.*/ || name =~ /.*!/
      return if (@__handled_names ||= []).include?(method)
      @__handled_names << method
      
      puts "*" * 100
      puts name
      class_eval "alias_method :__#{name}, :#{name}"
      class_eval <<-EOF
        def #{name}(transactional=true)
          __#{name}
        end
        
        def #{name}!()
          #{name}(false)
        end
      EOF
    end
      
  end
end