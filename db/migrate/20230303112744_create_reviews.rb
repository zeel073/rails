# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.integer :review
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
