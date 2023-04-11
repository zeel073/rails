# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.integer :rollNo
      t.string :name
      t.text :remarks

      t.timestamps
    end
  end
end
