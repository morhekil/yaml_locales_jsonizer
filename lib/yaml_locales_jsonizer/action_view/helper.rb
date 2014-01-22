module YamlLocalesJsonizer::ActionView
  module Helper

    def yaml_locales_jsonizer
      locales = YamlLocalesJsonizer::Loader.locales
      locales_json = ActiveSupport::JSON.encode locales
      javascript_tag "window.yaml_locales_jsonized = #{j locales_json}"
    end

  end
end
