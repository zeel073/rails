# frozen_string_literal: true

class Applicant < ApplicationRecord
  # has_and_belongs_to_many :exams
  has_many :agents
  has_many :exams, through: :agents
end
