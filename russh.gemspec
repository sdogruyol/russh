# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'russh/version'

Gem::Specification.new do |spec|
  spec.name          = "russh"
  spec.version       = Russh::VERSION
  spec.authors       = ["Serdar Dogruyol"]
  spec.email         = ["dogruyolserdar@gmail.com"]
  spec.summary       = %q{Russh: Ruby + SSH. SSH Config Manager for Ruby}
  spec.description   = %q{Russh: Ruby + SSH. SSH Config Manager for Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "2.99.0"
  spec.add_development_dependency "fakefs"
  spec.add_dependency "commander", "4.2.0"
end
