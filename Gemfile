source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.13'
gem 'pg'

# Template language
gem 'slim'
gem 'slim-rails'
gem 'simple_form'

gem 'RedCloth' # Suporte para Textile

gem 'google-analytics-rails'

group :development do
  gem 'awesome_print'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails", github: 'seyhunak/twitter-bootstrap-rails', branch: 'bootstrap3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails', '~> 1.0.3'
  gem 'semantic-mixins', '0.2.0'
  gem 'turbolinks', '~> 0.4.0'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'faker'
  gem 'capybara'
end

group :test do
  gem 'database_cleaner'
end

gem 'omniauth'
gem 'omniauth-twitter', '~> 1.0.0'
gem 'jquery-rails', '~> 2.3.0'
gem 'best_in_place'
gem 'friendly_id'

# Upload de imagem
gem 'carrierwave'
gem 'carrierwave-postgresql'
gem 'postgresql_lo_streamer', git: 'git://github.com/diogob/postgresql_lo_streamer.git'
gem 'rmagick'

# Cache
gem 'cache_digests'