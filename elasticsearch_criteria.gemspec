$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "elasticsearch_criteria/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "elasticsearch_criteria"
  s.version     = ElasticsearchCriteria::VERSION
  s.authors     = ["Fellipe Fingoli"]
  s.email       = ["ffingoli@atheva.com.br"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ElasticsearchCriteria."
  s.description = "TODO: Description of ElasticsearchCriteria."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"
end
