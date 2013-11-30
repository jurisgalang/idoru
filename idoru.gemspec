# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idoru/version'

Gem::Specification.new do |spec|
  spec.name          = 'idoru'
  spec.version       = Idoru::VERSION
  spec.authors       = ['Juris Galang']
  spec.email         = ['jurisgalang@gmail.com']
  spec.description   = %q{A two-factor authentication library}
  spec.summary       = %q{
    A Two-Factor Authentication library. This library provides the primitives
    to support a two-factor authentication feature.
  }
  spec.homepage      = 'https://github.com/jurisgalang/idoru'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'base32'
  spec.add_dependency 'rqrencoder'
  spec.add_dependency 'chunky_png'
end
