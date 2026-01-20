require_relative "lib/fizzy/saas/version"

Gem::Specification.new do |spec|
  spec.name        = "fizzy-saas"
  spec.version     = Fizzy::Saas::VERSION
  spec.authors     = [ "Mike Dalessio" ]
  spec.email       = [ "mike@37signals.com" ]
  spec.homepage    = "https://github.com/basecamp/fizzy-saas"
  spec.summary     = "37signals SaaS companion for Fizzy"
  spec.description = "Rails engine that bundles with Fizzy to offer the hosted version at https://app.fizzy.do"
  spec.license     = "O'Saasy"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/basecamp/fizzy-saas"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,exe}/**/*", "test/fixtures/**/*", "LICENSE.md", "Rakefile", "README.md"]
  end

  spec.bindir = "exe"
  spec.executables = [ "stripe-dev" ]

  spec.add_dependency "rails", ">= 8.1.0.beta1"
  spec.add_dependency "sentry-ruby"
  spec.add_dependency "sentry-rails"
end
