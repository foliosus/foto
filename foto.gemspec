# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foto/version'

Gem::Specification.new do |gem|
  gem.name          = "foto"
  gem.version       = Foto::VERSION
  gem.authors       = ["Peter Tran"]
  gem.email         = ["Peter Tran <ptran@optimiscorp.com>"]
  gem.description   = %q{placeholder}
  gem.summary       = %q{placeholder}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
