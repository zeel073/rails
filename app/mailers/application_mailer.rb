# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'zeel.essence@gmail.com'
  layout 'mailer'
end
