 # coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raleigh_events/version'

Gem::Specification.new do |spec|
  spec.name          = "raleigh_events"
  spec.version       = RaleighEvents::VERSION
  spec.authors       = ["Lani1321"]
  spec.email         = ["lani.berry13@gmail.com"]

  spec.summary       = %q{A: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{A: Write a longer description or delete this line.}
  spec.homepage      = "A: https://github.com/Lani1321/raleigh_events"
  spec.license       = "MIT"

  # spec.add_development_dependency "rspec" #I added this line so I can run rsepc

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "A: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"  #if I take out this dependency then require 'nokogiri' in lib/raleigh_events.rb doesn't work...so I know that it's loading it from the bundler path
end
