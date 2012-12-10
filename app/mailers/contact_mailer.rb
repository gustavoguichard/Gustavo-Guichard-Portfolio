class ContactMailer < ActionMailer::Base
	default to: "Gustavo Guichard <talk@gustavoguichard.com>",
  				from: "gustavoguichard@gmail.com"

  headers = {'Return-Path' => 'talk@gustavoguichard.com'}

  def contact_email(message)
  	@message = message
  	mail(
      subject: "Email pelo site!",
      from: "#{message.name} <#{message.email}>",
      return_path: "gustavoguichard@gmail.com",
      date: Time.now,
      content_type: "text/html"
    )
  end
end
