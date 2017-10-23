class ContactMailer < ApplicationMailer
  
  def contact(name, email, phone, subject, message)
    @greeting = "Hi, contact has just been made with araddi. Mail info are as follows."
    @name = name
    @phone = phone
    @message = message
    @email = email
    mail to: 'araddi.com@gmail.com', subject: subject, from: email
  end
end
