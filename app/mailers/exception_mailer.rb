class ExceptionMailer < ApplicationMailer
  def notification(receiver)
    mail(to: receiver, subject: "Exception notification error raised.")
  end
end