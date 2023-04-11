# frozen_string_literal: true

class RemoveMaleFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :male, :boolean
  end
end
