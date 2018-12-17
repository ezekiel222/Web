class ContactMailer < ActionMailer::Base
  default to: "coraleze232@gmail.com"
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

  mail(from: email, subject: 'Eze Contact Form Message')
  end
end
