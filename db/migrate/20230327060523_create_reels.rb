# frozen_string_literal: true

class CreateReels < ActiveRecord::Migration[7.0]
  def change
    create_table :reels do |t|
      t.string :reel_name
      t.timestamps
    end
  end
end
