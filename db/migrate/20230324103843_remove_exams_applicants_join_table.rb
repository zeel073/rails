# frozen_string_literal: true

class RemoveExamsApplicantsJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :exams, :applicants
  end
end
