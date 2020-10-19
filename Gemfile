source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

gem "rails", "6.0.0"
gem "puma", "3.12.1"
gem "sass-rails", "5.1.0"
gem "webpacker", "4.0.7"
gem "turbolinks", "5.2.0"
gem "jbuilder", "2.9.1"
gem "bootstrap-sass", "3.4.1"
gem "config"
gem "bcrypt", "3.1.13"
gem "bootsnap", "1.4.4", require: false
gem "kaminari"
gem "figaro"
gem "bootstrap-kaminari-views"

group :development, :test do
  gem "mysql2", "~> 0.4.10"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development do
  gem "web-console", "4.0.1"
  gem "listen", "3.1.5"
  gem "spring", "2.1.0"
  gem "spring-watcher-listen", "2.0.1"
  gem "faker", "2.1.2"
end

group :test do
  gem "capybara", "3.28.0"
  gem "selenium-webdriver", "3.142.3"
  gem "webdrivers", "4.1.2"
  gem "rails-controller-testing", "1.0.4"
  gem "minitest", "5.11.3"
  gem "minitest-reporters", "1.3.8"
  gem "guard", "2.15.0"
  gem "guard-minitest", "2.4.6"
end

group :production do
  gem "mysql2", "~> 0.4.10"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
