# frozen_string_literal: true

class AddVerifiedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verified, :boolean, default: false
  end
end
