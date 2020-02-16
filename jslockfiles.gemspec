require_relative 'lib/jslockfiles/version'

Gem::Specification.new do |spec|
  spec.name          = "jslockfiles"
  spec.version       = JSLockfiles::VERSION
  spec.authors       = ["Ryan B. Harvey"]
  spec.email         = ["ryan.b.harvey@gmail.com"]

  spec.summary       = %q{A pure Ruby parser for JavaScript lockfiles}
  spec.description   = %q{Parse JavaScript package lock files in your Ruby app with no JavaScript runtime dependencies.}
  spec.homepage      = "https://rubygems.org/gems/jslockfiles"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nihonjinrxs/jslockfiles"
  spec.metadata["changelog_uri"] = "https://github.com/nihonjinrxs/jslockfiles/blob/master/CHANGELOG.md"

  spec.add_dependency "semantic"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
