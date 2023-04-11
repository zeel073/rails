# frozen_string_literal: true

class StudentMailer < ApplicationMailer
  def welcome_email(student)
    @student = student
    @student_count = student.class.count
    mail(to: @student.email, subject: "A new entry of #{@student.name} has been created.")
  end
end
