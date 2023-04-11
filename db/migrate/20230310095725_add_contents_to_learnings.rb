# frozen_string_literal: true

class AddContentsToLearnings < ActiveRecord::Migration[7.0]
  def change
    add_column :learnings, :name, :string
    add_column :learnings, :channel, :string
    add_column :learnings, :chapter, :integer
    add_index :learnings, :name
  end
end
