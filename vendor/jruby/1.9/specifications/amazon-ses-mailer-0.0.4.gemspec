# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "amazon-ses-mailer"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eli Fox-Epstein", "Adam Bronte"]
  s.date = "2011-01-31"
  s.description = "Amazon SES mailer"
  s.email = ["eli@redhyphen.com", "adam@brontesaurus.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "amazon-ses-mailer"
  s.rubygems_version = "1.8.24"
  s.summary = "Amazon SES mailer"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-hmac>, [">= 0"])
      s.add_runtime_dependency(%q<mail>, [">= 0"])
    else
      s.add_dependency(%q<ruby-hmac>, [">= 0"])
      s.add_dependency(%q<mail>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-hmac>, [">= 0"])
    s.add_dependency(%q<mail>, [">= 0"])
  end
end
