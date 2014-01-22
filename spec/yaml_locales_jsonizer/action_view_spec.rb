require 'spec_helper'
require 'action_view'
require 'active_support/json'
require File.expand_path('../../../lib/yaml_locales_jsonizer', __FILE__)
require 'shared/locale_files'

describe YamlLocalesJsonizer::ActionView::Helper, '#yaml_locales_jsonizer' do
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  include described_class

  include_context 'locale files'

  it 'generates json data' do
    json_data = ActiveSupport::JSON.encode YamlLocalesJsonizer::Loader.locales
    expect(yaml_locales_jsonizer).to eq javascript_tag(
      "window.yaml_locales_jsonized = #{json_data}"
    )
  end
end
