module YamlLocalesJsonizer::Loader
  extend self

  def locales
    locale_files.reduce({}) do |locales, file|
      langdata = YAML.load_file file

      langdata.each_pair do |lang, translations|
        locales[lang] ||= style.empty_locale
        style.add_to_locale locales[lang], translations
      end

      locales
    end
  end

  private

  def locale_files
    cfg = YamlLocalesJsonizer
    cfg.load_path.select do |f|
      cfg.only_files.find { |m| File.fnmatch?(m, f) || File.basename(f) == m }
    end
  end

  def style
    YamlLocalesJsonizer::Styles::I18next
  end

end
