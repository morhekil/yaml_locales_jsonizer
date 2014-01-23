rails_load_path = Rails.configuration.i18n[:load_path]
YamlLocalesJsonizer.load_path ||= rails_load_path || []
