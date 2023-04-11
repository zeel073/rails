# frozen_string_literal: true

class ChangeColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :mobile_number, :bigint
  end
end
