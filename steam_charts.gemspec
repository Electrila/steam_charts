require_relative "lib/steam_charts/version"

Gem::Specification.new do |spec|
  spec.name          = "steam_charts"
  spec.version       = SteamCharts::VERSION
  spec.authors       = ["Megann Comstock"]
  spec.email         = ["megann.elizabeth.king@gmail.com"]

  spec.summary       = "SteamCharts scrapes data from https://steamcharts.com/ and displays the data in a user-friendly format."
  spec.homepage      = "https://github.com/Electrila/steam_charts"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Electrila/steam_charts"
  spec.metadata["changelog_uri"] = "https://github.com/Electrila/steam_charts/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "open-uri"
  spec.add_dependency "nokogiri"
  spec.add_dependency "mechanize"
  spec.add_dependency "date"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
