
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mapquest/api/version"

Gem::Specification.new do |spec|
  spec.name          = "mapquest-api"
  spec.version       = Mapquest::API::VERSION
  spec.authors       = ["Chase Clettenberg"]
  spec.email         = ["clettenberg@gmail.com"]

  spec.summary       = "Ruby API for Mapquest"
  spec.homepage      = "https://github.com/clettenberg/mapquest-api"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "webmock", "~> 3.11"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "pry", "~> 0.13"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_dependency "faraday", "~> 1.2"
  spec.add_dependency 'addressable', '~> 2.7'
end
