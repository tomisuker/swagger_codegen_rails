$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "swagger_codegen_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "swagger_codegen_rails"
  s.version     = SwaggerCodegenRails::VERSION
  s.authors     = ["techno brain"]
  s.email       = ["techno.rb@tbn.co.jp"]
  s.homepage    = "https://github.com/technobrain/swagger_codegen_rails"
  s.summary     = "Generator for swagger-blocks and swagger_ui_engine"
  s.description = "Description of SwaggerCodegenRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "swagger-blocks"
  s.add_dependency "swagger_ui_engine"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "ammeter"
  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec-rails"
end
