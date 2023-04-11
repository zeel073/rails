# frozen_string_literal: true

class Exam < ApplicationRecord
  # has_and_belongs_to_many :applicants
  has_many :agents
  has_many :applicants, through: :agents
end
