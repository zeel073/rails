# frozen_string_literal: true

class RemoveApplicantIdFromExams < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exams, :applicant, null: false, foreign_key: true, index: true
  end
end
