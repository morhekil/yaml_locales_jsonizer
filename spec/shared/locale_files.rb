shared_context 'locale files' do
  let(:locale_en) { { kaiju: 'Kaiju' } }
  let(:locale_ru) { { kaiju: 'Кайджу' } }
  let(:locale_files) do
    { 'en.yml' => { en: locale_en }, 'ru.yml' => { ru: locale_ru } }
  end

  before do
    allow(YamlLocalesJsonizer::Loader).to receive(:locale_files)
      .and_return(locale_files.keys)
    allow(YAML).to receive(:load_file) { |file| locale_files[file] }
  end
end
