# YamlLocalesJsonizer

Simple generation of JSON i18n data for the frontend based on Rails-style YAML
locales.

The gem provides an asset file for asset pipeline, to be used in production,
but it is quite cumbersome to use in development. Changes in dynamic assets
derived from other resources are not being detected and picked up by sprockets
properly, and they require a server restart and cache wipe to get applied.

To give you a better development experience, an action view helper is also
available, which allows on-reload locale updates, without any extra steps.

## Compatibility

The current version is built to support [i18next](http://i18next.com/), and
produces JSON data in the format expected by this tool. If you want to have
support for other i18n engines - open an issue with a feature request, or
(even better) - take a look at `styles/i18next.rb` file and send me a pull
request.

## Installation

Add this line to your application's Gemfile:

    gem 'yaml_locales_jsonizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaml_locales_jsonizer

## Usage

Add to your asset manifest file, for production:

```
//= require yaml_locales_jsonizer
```

For effortless locale updates in dev environment, add a helper call to your
view (e.g. layout file).  Make sure to add it AFTER your regular assets, to let
it override cached asset data!

```erb
= javascript_include_tag 'application' # application assets
= yaml_locales_jsonizer if Rails.env.development?
```

JSON data is exposed via `yaml_locales_jsonised` variable, so initialize
i18next with this variable as the resource storage:

```javascript
i18n.init({resStore: yaml_locales_jsonized});
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
