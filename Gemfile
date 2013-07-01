source "http://rubygems.org"

gem "rails", "~> 3.1.0"
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
  gem "pg", platform: :ruby
  gem "activerecord-jdbcpostgresql-adapter", platform: :jruby
end

group :development do
  gem "rspec-rails", "~> 2.4"
  gem "sqlite3-ruby", require: "sqlite3", platform: :ruby
  gem "activerecord-jdbcsqlite3-adapter", platform: :jruby
  gem "bullet"
  gem "capybara"
  gem "guard"
  gem "guard-jruby-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-nav"
end

group :test do
  gem "factory_girl_rails"
  gem "assert_difference"
  gem "simplecov", :require => false
  gem "spork", "> 0.9.0.rc"
  gem "capybara-webkit"
  gem "database_cleaner"
end

group :assets do
  gem "coffee-rails", " ~> 3.1.0"
  gem "uglifier"
  gem "sass-rails", "~> 3.1"
  gem "bootstrap-sass", "~> 2.1.0.0"
end

