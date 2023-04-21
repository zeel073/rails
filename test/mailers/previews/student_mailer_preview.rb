# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
  def welcome
    StudentMailer.welcome_email(Student.last)
  end
end
