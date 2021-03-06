$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "go_gamification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "go_gamification"
  s.version     = GoGamification::VERSION
  s.authors     = ["João Carlos Ottobboni"]
  s.email       = ["jcottobboni@gmail.com"]
  s.homepage    = "http://www.gorails.com.br"
  s.summary     = "go_gamification engine"
  s.description = "go_gamification engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "draper"
  s.add_dependency "rails"

end
