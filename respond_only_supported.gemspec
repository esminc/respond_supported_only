# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'respond_supported_only/version'

Gem::Specification.new do |spec|
  spec.name          = "respond_supported_only"
  spec.version       = RespondSupportedOnly::VERSION
  spec.authors       = ["moro"]
  spec.email         = ["moronatural@gmail.com"]
  spec.summary       = %q{Reject request with unexpected Accept header.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionpack', '>= 3.2.17'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", ">= 3.2.17"
  spec.add_development_dependency "rspec-rails", "~> 3.0"
end
