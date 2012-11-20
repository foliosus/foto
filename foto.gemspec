# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foto/version'

Gem::Specification.new do |gem|
  gem.name          = "foto"
  gem.version       = Foto::VERSION
  gem.authors       = ["Peter Tran"]
  gem.email         = ["Peter Tran <ptran@optimiscorp.com>"]
  gem.description   = %q{Provides an interface for communicating with FOTO Patient Inquiry API}
  gem.summary       = %q{Provides an interface for communicating with FOTO Patient Inquiry API}
  gem.homepage      = ""

  gem.add_dependency "json"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
