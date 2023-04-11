# frozen_string_literal: true

class ExampleJob < ApplicationJob
  def perform(id)
    User.find(id).update(verified: true)
    UserMailer.welcome_email(id).deliver_later
  end
end
