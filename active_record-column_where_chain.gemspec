# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/column_where_chain/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record-column_where_chain"
  spec.version       = ActiveRecord::ColumnWhereChain::VERSION
  spec.authors       = ["lsylvester"]
  spec.email         = ["lachlan.sylvester@hypothetical.com.au"]
  spec.description   = %q{Add Column base where chains to ActiveRecord}
  spec.summary       = %q{Add Column base where chains to ActiveRecord}
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
