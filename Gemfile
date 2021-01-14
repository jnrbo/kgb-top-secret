source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0', '>= 6.0.3'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'simplecov', require: false
  gem 'webmock'
  gem 'vcr', '~> 6.0.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails', '~> 4.0.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
