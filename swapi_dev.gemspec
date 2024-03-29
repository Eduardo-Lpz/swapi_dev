# frozen_string_literal: true

require_relative "lib/swapi_dev/version"

Gem::Specification.new do |spec|
  spec.name = "swapi_dev"
  spec.version = SwapiDev::VERSION
  spec.authors = ["Eduardo Lopez"]
  spec.email = ["jramos@arkusnexus.com"]

  spec.summary = "SWAPI Wrapper"
  spec.description = "Ruby wrapper for The Star Wars API"
  spec.homepage = "https://github.com/Eduardo-Lpz/swapi_dev"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.0.0"

  spec.add_development_dependency "minitest", "~> 5.19"
  spec.add_development_dependency "rake", "~> 13.0", ">= 13.0.6"
  spec.add_development_dependency "rubocop", "~> 1.55", ">= 1.55.1"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
  spec.add_development_dependency "webmock", "~> 3.18", ">= 3.18.1"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Eduardo-Lpz/swapi_dev"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }
end
