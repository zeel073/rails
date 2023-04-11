# frozen_string_literal: true

class Agent < ApplicationRecord
  belongs_to :applicant
  belongs_to :exam
end
