# frozen_string_literal: true

class AddGenderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :string
  end
end
