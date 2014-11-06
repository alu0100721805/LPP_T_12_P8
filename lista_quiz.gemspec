# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lista_quiz/version'

Gem::Specification.new do |spec|
  spec.name          = "lista_quiz"
  spec.version       = Quiz::VERSION
  spec.authors       = ["Juan Jose Gregorio  Diaz Marrero"]
  spec.email         = ["alu0100721805@ull.edu.es"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~>2.11"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"	
  spec.add_development_dependency "guard-bundler"
end
 
