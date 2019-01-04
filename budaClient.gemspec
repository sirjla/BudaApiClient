# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "budaClient/version"

Gem::Specification.new do |spec|
  spec.name          = "budaClient"
  spec.version       = BudaClient::VERSION
  spec.authors       = ["Platanus", "Jose Luis Assadi"]
  spec.email         = ["rubygems@platan.us", "jose.luis@platan.us"]
  spec.homepage      = "https://github.com/platanus/budaClient/master"
  spec.summary       = "Buda.com api client"
  spec.description   = "Buda.com api client"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rubocop", "~> 0.49"
  spec.add_development_dependency "json"

  spec.add_runtime_dependency 'http', '~> 3.3.0'
end
