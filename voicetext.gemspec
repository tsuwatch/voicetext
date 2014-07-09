# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voicetext/version'

Gem::Specification.new do |spec|
  spec.name          = "voicetext"
  spec.version       = Voicetext::VERSION
  spec.authors       = ["Tomohiro Suwa（tsuwatch）"]
  spec.email         = ["neoen.gsn@gmail.com"]
  spec.summary       = %q{voicetext API Ruby Client}
  spec.description   = %q{voicetext API Ruby Client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
