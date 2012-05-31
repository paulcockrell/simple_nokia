# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'lazy_nokia_maps/version'

Gem::Specification.new do |s|
  s.name        = "lazy_nokia_maps"
  s.version     = LazyNokiaMaps::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Paul Cockrell']
  s.email       = ['paulcockrell@gmail.com']
  s.homepage    = "https://github.com/paulcockrell/lazy_nokia_maps"
  s.summary     = "lazy nokia maps gem for rails"
  s.description = "Generate Nokia maps quickly in your rubygem/rails"

  s.extra_rdoc_files  = [ "README.md", "CHANGELOG.md" ]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.required_rubygems_version = "~> 1.3"

  s.add_dependency "bundler", "~> 1.0"

  s.add_development_dependency "webrat","~> 0.7"
  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "rails", "~> 3.0"

  s.description = <<-DESC
    lazy_nokia_maps is a Rails 3.x gem for displaying Nokia maps.
  DESC

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'

end
