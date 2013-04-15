source "http://rubygems.org"

#ruby=jruby-1.7.3
ruby "1.9.3", :engine => "jruby", :engine_version => "1.7.3"

gem "rails", "3.1.0"
gem "jquery-rails", ">= 0.2.6"
gem "hpricot"
gem "premailer"
gem "active_attr"
gem "backbone-on-rails"
gem "newrelic_rpm"
gem "url2png"
gem "amazon-ses-mailer"
gem "paypal-recurring"
gem "puma"


group :production do
  # gem "pg"
  gem "activerecord-jdbcpostgresql-adapter"
end

group :development do
  gem "rspec-rails", "~> 2.4"
  # gem "sqlite3-ruby", :require => "sqlite3"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "bullet"
  gem "capybara"
end

group :development, :test do
  gem "pry"
  gem "pry-nav"
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "assert_difference"
  gem "simplecov", :require => false
  gem "spork", "> 0.9.0.rc"
end

group :assets do
  gem "coffee-rails", " ~> 3.1.0"
  gem "uglifier"
  gem "sass-rails", "~> 3.1"
  gem "bootstrap-sass", "~> 2.1.0.0"
end

