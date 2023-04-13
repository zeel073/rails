# frozen_string_literal: true

class CreateExamsApplicantsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :exams, :applicants
  end
end