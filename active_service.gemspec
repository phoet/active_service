# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_service/version"

Gem::Specification.new do |s|
  s.name        = "active_service"
  s.version     = ActiveService::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peter Schröder"]
  s.email       = ["ps@nofail.de"]
  s.homepage    = "http://nofail.de"
  s.summary     = %q{Transactional services for Rails}
  s.description = %q{ActiveService is a Rails extension that aims at creating reusable, transactional services in your application to make your code more DRY. }

  s.rubyforge_project = "active_service"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('rake', '~> 0.8.7')
  s.add_dependency('rails', '~> 3.0.0')
  
  s.add_development_dependency('rspec', '~> 2.6.0')
  s.add_development_dependency('fuubar', '~> 0.0.4')
end
