# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_shortener/version'

Gem::Specification.new do |gem|
  gem.name          = "google_shortener"
  gem.version       = VERSION
  gem.authors       = ["Chaitanya Vellanki"]
  gem.email         = ["me@chaitanyavellanki.com"]
  gem.description   = %q{Rubygem to shorten long url}
  gem.summary       = %q{Uses url shortener services from Google}
  gem.homepage      = "https://github.com/chaitanyav/google_shortener"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "shoulda-context"
  gem.add_runtime_dependency "json"
end
