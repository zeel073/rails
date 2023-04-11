# frozen_string_literal: true

class RemoveFemaleFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :female, :boolean
  end
end
