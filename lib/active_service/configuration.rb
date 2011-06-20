module ActiveService
  class Configuration
    
    CONFIG_FILE = "config/active_service.yml"
    DEFAULTS = {'path' => 'app/services'}
    
    class << self
      def path
        conf['path']
      end
      
      private()

      def conf
        return DEFAULTS unless File.exist?(CONFIG_FILE)
        File.open(CONFIG_FILE) { |file| YAML.load(file) }
      end
    end
  end
end
