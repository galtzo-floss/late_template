# frozen_string_literal: true

gem_version =
  if RUBY_VERSION >= "3.1" # rubocop:disable Gemspec/RubyVersionGlobalsUsage
    # Loading Version into an anonymous module allows version.rb to get code coverage from SimpleCov!
spec.name = "late_template"
 spec.version = gem_version
spec.authors = ["Annibelle Boling"]
spec.email = ["annibelle.boling@gmail.com"]
    # NOTE: Use __FILE__ or __dir__ until removal of Ruby 1.x support
  # Linux distros often package gems and securely certify them independent
  #   of the official RubyGem certification process. Allowed via ENV["SKIP_GEM_SIGNING"]
  # Ref: https://gitlab.com/oauth-xx/version_gem/-/issues/3
  # Hence, only enable signing if `SKIP_GEM_SIGNING` is not set in ENV.
  # See CONTRIBUTING.md
  unless ENV.include?("SKIP_GEM_SIGNING")
  spec.metadata["homepage_uri"] = "https://#{spec.name.tr("_", "-")}.galtzo.com/"
  spec.metadata["source_code_uri"] = "#{spec.homepage}/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/#{spec.name}/#{spec.version}"
  # Specify which files are part of the released package.
  spec.files = Dir[
    # Splats (alphabetical)
    "lib/**/*.rb",
  ]
  # Automatically included with gem package, no need to list again in files.
  spec.extra_rdoc_files = Dir[
    # Files (alphabetical)
    "CHANGELOG.md",
    "CITATION.cff",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
  spec.bindir = "exe"
  # files listed are relative paths from bindir above.
  spec.executables = []
    "README.md",
  # Release Tasks
  spec.add_development_dependency("stone_checksums", "~> 1.0")            # ruby >= 2.2.0

  ### Testing
  spec.add_development_dependency("appraisal2", "~> 3.0")                 # ruby >= 1.8.7
  spec.add_development_dependency("rspec", "~> 3.13")                     # ruby >= 0
  spec.add_development_dependency("rspec-block_is_expected", "~> 1.0")    # ruby >= 1.8.7
  spec.add_development_dependency("rspec_junit_formatter", "~> 0.6")      # ruby >= 2.3.0, for GitLab Test Result Parsing
  spec.add_development_dependency("rspec-stubbed_env", "~> 1.0")          # ruby >= 2.3.0 (helper for stubbing ENV in specs)
  spec.add_development_dependency("silent_stream", "~> 1.0", ">= 1.0.11") # ruby >= 2.3.0, for output capture

  # Development tasks
  spec.add_development_dependency("rake", "~> 13.0")                      # ruby >= 2.2
  #       all versions of Ruby that will run in CI.
  #       This gem, and its runtime dependencies, will install on Ruby down to 1.9.2.
  #       This gem, and its development dependencies, will install on Ruby down to 2.3.x.
  #       This is because in CI easy installation of Ruby, via setup-ruby, is for >= 2.3.
  #       Thus, dev dependencies in gemspec must have
  #
  #       required_ruby_version ">= 2.3" (or lower)
  #
  #       Development dependencies that require strictly newer Ruby versions should be in a "gemfile",
  #       and preferably a modular one (see gemfiles/modular/*.gemfile).
    "REEK",
    "RUBOCOP.md",
    "SECURITY.md",
  ]
  spec.rdoc_options += [
    "--title",
    "#{spec.name} - #{spec.summary}",
    "--main",
    "CHANGELOG.md",
    "CITATION.cff",
    "CODE_OF_CONDUCT.md",
    "CONTRIBUTING.md",
    "LICENSE.txt",
    "README.md",
    "REEK",
    "RUBOCOP.md",
    "SECURITY.md",
    "--line-numbers",
    "--inline-source",
    "--quiet",
  ]
  spec.summary = "Six-degrees of (Kevin Bacon's?) Module"
  spec.description = "Builds a tree of module inclusion of a target module into other modules"
  spec.homepage = "https://github.com/galtzo-floss/library_tree"
    require "library_tree/version"
    LibraryTree::Version::VERSION
  end
Gem::Specification.new do |spec|
  spec.name = "late_template"
  spec.version = LateTemplate::VERSION
  spec.authors = ["Annibelle Boling"]
  spec.email = ["annibelle.boling@gmail.com"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "diff-lcs", ">= 1.5"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
