module ActiveService
  class Base
    def self.method_added(method)
      name = method.to_s
      return if name =~ /__.*/ || name =~ /.*!/
      return if (@__handled_names ||= []).include?(method)
      @__handled_names << method
      
      puts "*" * 100
      puts name
      arity = instance_method(method).arity
      puts "arity is #{arity}"
      old_name = "__#{name}"
      class_eval "alias_method :#{old_name}, :#{name}"
      class_eval "alias_method :#{name}!, :#{name}"
      new_method_definition, old_method_definition = if arity == 0
        ["#{name}()", "#{old_name}()"]
      elsif arity == 1
        ["#{name}(params)", "#{old_name}(params)"]
      else
        ["#{name}(*params)", "#{old_name}(*params)"]
      end
      puts "new #{new_method_definition}"
      puts "old #{old_method_definition}"
      class_eval <<-EOF
        def #{new_method_definition}
          #{old_method_definition}
        end
      EOF
    end
      
  end
end