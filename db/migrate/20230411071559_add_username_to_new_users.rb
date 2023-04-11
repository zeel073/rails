# frozen_string_literal: true

class AddUsernameToNewUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :new_users, :username, :string
  end
end
