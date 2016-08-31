 # coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raleigh_events/version'

Gem::Specification.new do |spec|
  spec.name          = "raleigh_events"
  spec.version       = RaleighEvents::VERSION
  spec.authors       = ["Lani1321"]
  spec.email         = ["lani.berry13@gmail.com"]

  spec.summary       = %q{This gem lists upcoming events in the Raleigh-Durham area.}
  spec.description   = %q{This gem lists awesome upcoming events in the Raleigh-Durham area. You can see more details on each event if you wish!}
  spec.homepage      = "https://github.com/Lani1321/raleigh_events"
  spec.license       = "MIT"

  # spec.add_development_dependency "rspec" #I added this line so I can run rsepc

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
