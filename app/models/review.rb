# frozen_string_literal: true

class Review < ApplicationRecord
  include Visible
  belongs_to :student

  delegate :hello, to: :student

  validates :reviewer, presence: true
  validates :review, presence: true, numericality: { only_integer: true }

  scope :privatezeel, -> { where(status: 'private') }
  scope :publiczeel, -> { where(status: ['public', nil]) }
  scope :archivedzeel, -> { where(status: 'archived') }
end
