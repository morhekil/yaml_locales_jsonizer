# YamlLocalesJsonizer

Simple generation of JSON i18n data for the frontend based on Rails-style YAML
locales.

The gem provides the following:

1. Asset file for the asset pipeline, to be used in production.
2. View helper, to assist with locale updates in development.

The reason we need both an asset file and a view helper is that changes in
dynamic assets derived from other resources are not being detected and picked
up by sprockets properly, and they require a full server restart AND cache wipe
to force the asset cache to be recompiled, and the change to get applied.

To provide better development experience, an action view helper allows to
override the asset file, and inject the correct JSON data into the page
directly. Of course, due to the increased size of HTML pages, it is not a
recommended technique for production use.

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

## Advanced configuration

Gem should be usable out of the box, loading all YAML locales available in
Rails. Additionally, it can be configured with an initializer, e.g.
`config/initializers/yaml_locales_jsonizer.rb`. Example:

```  ruby
YamlLocalesJsonizer.configure do
  # Add to or overwrite load path. By default the load path uses Rails' i18n
  # settings available in Rails.configuration.i18n[:load_path]
  load_path << "/some/other/path"

  # Filter out files discovered via load_path, and jsonize only the ones
  # matching the list. List could contain either file names, or shell-like
  # glob patterns (matched with [File#fnmatch](http://www.ruby-doc.org/core-2.1.0/File.html#method-c-fnmatch))
  only_files %w(ru.yml en.yml)
end

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
