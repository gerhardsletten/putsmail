# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-jruby-rspec"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Kutner"]
  s.date = "2013-04-24"
  s.description = "Guard::JRubyRSpec keeps a warmed up JVM ready to run your specs."
  s.email = ["jpkutner@gmail.com"]
  s.homepage = "http://rubygems.org/gems/guard-jruby-rspec"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-jruby-rspec"
  s.rubygems_version = "1.8.25"
  s.summary = "Guard gem for JRuby RSpec"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 0.10.0"])
      s.add_runtime_dependency(%q<guard-rspec>, [">= 0.7.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7"])
    else
      s.add_dependency(%q<guard>, [">= 0.10.0"])
      s.add_dependency(%q<guard-rspec>, [">= 0.7.3"])
      s.add_dependency(%q<rspec>, ["~> 2.7"])
    end
  else
    s.add_dependency(%q<guard>, [">= 0.10.0"])
    s.add_dependency(%q<guard-rspec>, [">= 0.7.3"])
    s.add_dependency(%q<rspec>, ["~> 2.7"])
  end
end
