require 'spec_helper'
require File.expand_path('../../../lib/yaml_locales_jsonizer', __FILE__)
require 'shared/locale_files'

describe YamlLocalesJsonizer::Loader, '.locales' do
  include_context 'locale files'
  subject(:load_locales) { described_class.locales }

  it 'loads locale files' do
    expect(load_locales).to eq ({
      en: { translation: locale_en },
      ru: { translation: locale_ru }
    })
  end
end
