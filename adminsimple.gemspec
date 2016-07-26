# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'adminsimple/version'

Gem::Specification.new do |s|
  s.name        = 'adminsimple'
  s.version     = Adminsimple::VERSION
  s.authors     = ['Mode Set']
  s.email       = ['info@modeset.com']
  s.homepage    = 'http://github.com/modeset/adminsimple'
  s.summary     = 'AdminSimple: Rails admin interface for CMSimple'
  s.description = 'A Rails admin interface base built on coffeescript, haml, sass'
  s.licenses    = ['MIT']

  s.files       = Dir["{lib,app,config,db,vendor}/**/*"] + ["MIT.LICENSE", "README.md"]
  s.test_files  = Dir["{spec}/**/*"]

  # Runtime Dependencies
  s.add_dependency 'railties', ['>= 3.2.5','< 5']
  s.add_dependency 'navigasmic', '>= 1.0.5'
  s.add_dependency 'simple_form', '>= 2.1.0'
  s.add_dependency 'inherited_resources', '>= 1.6.0'
  s.add_dependency 'has_scope', '>= 0.7.0'
  s.add_dependency 'crummy'
end
