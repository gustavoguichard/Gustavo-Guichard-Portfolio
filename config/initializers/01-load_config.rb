CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
unless Rails.env.production?
  ENV['TWITTER_USERNAME'] = CONFIG['TWITTER_USERNAME']
end