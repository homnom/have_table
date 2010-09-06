require 'rubygems'

spec = Gem::Specification.new do |s| 
  s.name = "have_table"
  s.version = "0.0.3"
  s.author = "Andrew Paradise"
  s.email = "adparadise@gmail.com"
  s.homepage = "http://andrewparadise.com/"
  s.platform = Gem::Platform::RUBY
  s.description = "An RSpec matcher for tables with headers."
  s.summary = "An RSpec matcher for view-testing tables."
  s.files = Dir.glob("{bin,lib}/**/*")
  s.require_path = "lib"
  s.test_files = Dir.glob("{spec}/**/*spec.rb")
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.add_dependency("rspec", ">= 1.2.9")
  s.add_dependency("webrat", ">= 0.7.1")
end
 
