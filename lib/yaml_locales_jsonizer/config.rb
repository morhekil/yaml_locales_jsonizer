module YamlLocalesJsonizer::Config
  attr_accessor :config

  DEFAULTS = {
    load_path: (defined?(Rails) && Rails.configuration.i18n[:load_path]) || [],
    only_files: ['*.yml']
  }

  def self.extended(mod)
    mod.init_config
  end

  def init_config
    self.config = DEFAULTS
  end

  def configure(&block)
    instance_eval(&block)
    config
  end

  DEFAULTS.keys.each do |method_name|
    define_method method_name do |*vals|
      config[method_name] = vals.first if vals.any?
      config[method_name]
    end

    define_method "#{method_name}=".to_sym do |val|
      config[method_name] = val
    end
  end

end
