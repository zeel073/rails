# frozen_string_literal: true

class AddLanguageToAgents < ActiveRecord::Migration[7.0]
  def change
    add_column :agents, :language, :string
  end
end
