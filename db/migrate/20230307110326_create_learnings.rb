# frozen_string_literal: true

class CreateLearnings < ActiveRecord::Migration[7.0]
  def change
    create_table :learnings, &:timestamps
  end
end
