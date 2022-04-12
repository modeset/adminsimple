source 'http://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'crummy', github: 'CirrusMD/crummy'

gemspec

# used by the dummy application
gem 'rails', '>= 3.2.8'
gem 'sqlite3'

group :development, :test do
  gem 'rspec-rails'
  gem 'teabag'

  # required for travis-ci and linux environments
  gem 'phantomjs-linux' if RUBY_PLATFORM =~ /linux/
end
