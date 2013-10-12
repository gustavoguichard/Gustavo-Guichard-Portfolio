ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gustavoguichard.com",
  :user_name            => Configuration[:email_username],
  :password             => Configuration[:email_password],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://gustavoguichard.com/"