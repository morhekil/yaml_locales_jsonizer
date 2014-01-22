shared_context 'locale files' do
  let(:locale_en) { { kaiju: 'Kaiju' } }
  let(:locale_ru) { { kaiju: 'Кайджу' } }
  let(:locale_files) do
    { 'en.yml' => { en: locale_en }, 'ru.yml' => { ru: locale_ru } }
  end

  before do
    # add fake data files to load path
    fs = locale_files.keys
    YamlLocalesJsonizer.configure { self.load_path += fs }

    # and stub YAML to 'load' them
    allow(YAML).to receive(:load_file) { |file| locale_files[file] }
  end
end
