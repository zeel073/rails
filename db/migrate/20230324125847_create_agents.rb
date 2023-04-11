# frozen_string_literal: true

class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.references :applicant, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
