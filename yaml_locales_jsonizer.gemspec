# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_locales_jsonizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'yaml_locales_jsonizer'
  spec.version       = YamlLocalesJsonizer::VERSION
  spec.authors       = ['Oleg Ivanov']
  spec.email         = ['morhekil@morhekil.net']
  spec.description   = %q{Simple generation of JSON data for a frontend from Rails-style YAML locales}
  spec.summary       = %q{Simple generation of JSON data for a frontend from Rails-style YAML locales}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'actionpack'
  spec.add_runtime_dependency 'activesupport'
end
