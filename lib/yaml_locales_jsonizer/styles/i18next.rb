module YamlLocalesJsonizer
  module Styles
    module I18next
      extend self

      def empty_locale
        { translation: {} }
      end

      def add_to_locale(locale, new_data)
        locale[:translation].merge! new_data
      end

    end
  end
end
