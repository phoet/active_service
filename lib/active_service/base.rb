require 'active_record'

module ActiveService
  class Base
    def self.method_added(method)
      name = method.to_s
      return if name =~ /__.*/ || name =~ /.*!/
      return if (@__handled_names ||= []).include?(method)
      @__handled_names << method
      arity = instance_method(method).arity
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
      class_eval <<-EOF
        def #{new_method_definition}
          ActiveRecord::Base.transaction do
            #{old_method_definition}
          end
        end
      EOF
    end
      
  end
end