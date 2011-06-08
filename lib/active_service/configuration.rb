module ActiveService
  class Configuration
    class << self
      attr_accessor :path

      def configure(options={})
        init_config
        if block_given?
          yield self
        else
          options.each do |key, value|
            send(:"#{key}=", value)
          end
        end
        self
      end

      def reset
        init_config(true)
      end

      private()

      def init_config(force=false)
        return if @init && !force
        @init           = true
        @path           = 'app/services'
      end
    end
  end
end
