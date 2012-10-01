ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gustavoguichard.com",
  :user_name            => "gustavoguichard",
  :password             => "indonesiA2011",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://gustavoguichard.com/"