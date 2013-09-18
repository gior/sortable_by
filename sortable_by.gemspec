# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sortable_by/version'

Gem::Specification.new do |spec|
  spec.name          = "sortable_by"
  spec.version       = SortableBy::VERSION
  spec.authors       = ["Giorgio Sidari"]
  spec.email         = ["giorgio@sidari.it"]
  spec.description   = %q{Sort an ActiveRecord model by any attribute and represent it through a (possibly inverted) image}
  spec.summary       = %q{Add basic sorting capabilities to an Activerecord model and its view}
  spec.homepage      = "https://github.com/gior/sortable_by"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl", "~>3.6.2"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "protected_attributes"
end
