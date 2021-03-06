# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foto/version'

Gem::Specification.new do |gem|
  gem.name          = "foto"
  gem.version       = Foto::VERSION
  gem.authors       = ["Peter Tran", "Brent Miller"]
  gem.email         = ["Brent Miller <brent@fixyourownback.com>"]
  gem.description   = %q{Provides an interface for communicating with FOTO Patient Inquiry API}
  gem.summary       = %q{Provides an interface for communicating with FOTO Patient Inquiry API}
  gem.homepage      = "https://github.com/foliosus/foto"
  gem.license       = 'MIT'

  gem.add_dependency "yajl-ruby"
  gem.add_dependency "nokogiri"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
