class UserMailer < ApplicationMailer
  default from: "jana.hlaucova@example.com"

  def contact_form(email, name, message)
    @message = message
    @name = name
    mail(from: email,
         to: 'jana.sisanova@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Imperium Munich"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end
end
