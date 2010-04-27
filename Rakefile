spec = Gem::Specification.new do |s| 
  s.name = "HaveTable"
  s.version = "0.0.1"
  s.author = "Andrew Paradise"
  s.email = "adparadise@gmail.com"
  s.homepage = "http://andrewparadise.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "An RSpec matcher for view-testing tables."
  s.files = FileList["{bin,lib}/**/*"].to_a
  s.require_path = "lib"
  s.autorequire = "have_table"
  s.test_files = FileList["{spec}/**/*spec.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  s.add_dependency("rspec", ">= 1.2.9")
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end
