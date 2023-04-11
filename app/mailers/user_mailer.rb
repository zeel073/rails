# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(id)
    @id = id
    mail(to: 'zeelsakariya07@gmail.com', subject: "A new entry of #{@id} has been created.")
  end
end
