class ContactMailer < ActionMailer::Base
	default :to => "Gustavo Guichard <gustavoguichard@gmail.com>",
  				:from => "talk@gustavoguichard.com"

  headers = {'Return-Path' => 'talk@gustavoguichard.com'}

  def contact_email(message)
  	@message = message
  	mail(
      :to => "gustavoguichard@gmail.com",
      :subject => "Email pelo site!",
      :from => "#{message.name} <#{message.email}>",
      :return_path => "talk@gustavoguichard.com",
      :date => Time.now,
      :content_type => "text/html"
    )
  end
end
