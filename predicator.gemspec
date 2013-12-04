# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'predicator/version'

Gem::Specification.new do |spec|
  spec.name          = "predicator"
  spec.version       = Predicator::VERSION
  spec.authors       = ["lsylvester"]
  spec.email         = ["lachlan.sylvester@hypothetical.com.au"]
  spec.description   = %q{Add predicate support to the Active Record query API}
  spec.summary       = %q{Add predicate support to the Active Record query API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.0"


  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"

end
