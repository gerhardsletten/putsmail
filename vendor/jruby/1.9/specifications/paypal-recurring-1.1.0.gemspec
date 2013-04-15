# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "paypal-recurring"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nando Vieira"]
  s.date = "2012-06-01"
  s.description = "PayPal Express Checkout API Client for recurring billing."
  s.email = ["fnando.vieira@gmail.com"]
  s.homepage = "http://rubygems.org/gems/paypal-recurring"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "PayPal Express Checkout API Client for recurring billing."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
