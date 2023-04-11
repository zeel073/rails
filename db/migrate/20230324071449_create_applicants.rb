# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.integer :enrollment

      t.timestamps
    end
  end
end
