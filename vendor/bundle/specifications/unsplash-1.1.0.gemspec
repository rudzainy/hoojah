# -*- encoding: utf-8 -*-
# stub: unsplash 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "unsplash"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Klaassen"]
  s.bindir = "exe"
  s.date = "2015-09-17"
  s.email = ["aaron@crew.co"]
  s.homepage = "https://github.com/CrewLabs/unsplash_rb"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby wrapper for the Unsplash API."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.13.5"])
      s.add_runtime_dependency(%q<oauth2>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.9.3"])
      s.add_development_dependency(%q<webmock>, ["~> 1.20.4"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.13.5"])
      s.add_dependency(%q<oauth2>, ["~> 1.0.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_dependency(%q<vcr>, ["~> 2.9.3"])
      s.add_dependency(%q<webmock>, ["~> 1.20.4"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.13.5"])
    s.add_dependency(%q<oauth2>, ["~> 1.0.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.3.0"])
    s.add_dependency(%q<vcr>, ["~> 2.9.3"])
    s.add_dependency(%q<webmock>, ["~> 1.20.4"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
