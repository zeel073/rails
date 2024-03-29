# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :exam_name
      t.string :difficulty
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
