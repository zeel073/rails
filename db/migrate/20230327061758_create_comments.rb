# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_name
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
