# frozen_string_literal: true

class CreateUserdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :userdetails do |t|
      t.text :address
      t.boolean :is_married
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
