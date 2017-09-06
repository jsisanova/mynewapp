class UserMailer < ApplicationMailer
  default from: "jana.hlaucova@example.com"

  def contact_form(email, name, message)
  @message = message
  @name = name
    mail(from: email,
         to: 'jana.sisanova@example.com',
         subject: "A new contact form message from #{name}")
  end
end
