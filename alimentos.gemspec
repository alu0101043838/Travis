lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "alimentos/version"

Gem::Specification.new do |spec|
  spec.name          = "alimentos"
  spec.version       = Alimentos::VERSION
  spec.authors       = ["Edgar Figueroa González"]
  spec.email         = ["alu0101043838@ull.edu.es"]

  spec.summary       = %q{Desarrollo de una clase para representar alimentos}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101043838.git"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
    # delete this section to allow pushing this gem to any host.
    if spec.respond_to?(:metadata)
      spec.metadata['allowed_push_host'] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101043838.git"
    else
      raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
    end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
