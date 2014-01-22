module YamlLocalesJsonizer
  class Railtie < Rails::Engine
    initializer 'yaml_locales_jsonizer.view_helper' do
      ::ActionView::Base.class_eval do
        include ::YamlLocalesJsonizer::ActionView::Helper
      end
    end
  end
end
