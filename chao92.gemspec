# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chao92/version'

Gem::Specification.new do |spec|
  spec.name          = "chao92"
  spec.version       = Chao92::VERSION
  spec.authors       = ["Eval Air"]
  spec.email         = ["pkuimehyd@163.com"]
  spec.summary       = %q{An estimator to estimate species richness based on Cho92 estimator}
  spec.description   = %q{...}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
