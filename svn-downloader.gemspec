# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svn/downloader/version'

Gem::Specification.new do |spec|
  spec.name          = 'svn-downloader'
  spec.version       = SVN::Downloader::VERSION
  spec.authors       = ['Dāvis']
  spec.email         = ['davispuh@gmail.com']
  spec.description   = 'Simple way to automatically download files from SVN repositories from remote locations'
  spec.summary       = 'Library for downloading SVN repositories'
  spec.homepage      = 'https://github.com/davispuh/svn-downloader'
  spec.license       = 'UNLICENSE'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'net_dav'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'simplecov'
end
