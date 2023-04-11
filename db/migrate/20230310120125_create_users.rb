# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :mobile_number
      t.string :name
      t.string :surname
      t.boolean :male
      t.boolean :female

      t.timestamps
    end
  end
end
