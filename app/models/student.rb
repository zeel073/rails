# frozen_string_literal: true

class Student < ApplicationRecord
  include Visible
  extend FriendlyId
  has_many :reviews, dependent: :destroy

  def hello
    'hello delegate'
  end

  # validates :rollNo, presence: true
  validates :rollNo, numericality: { only_integer: true }
  validates :name, presence: true, length: { minimum: 2 }
  validates :remarks, presence: true, length: { minimum: 10 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 4, maximum: 254 }

  scope :privatezeel, -> { where(status: 'private') }
  scope :publiczeel, -> { where(status: ['public', nil]) }
  scope :archivedzeel, -> { where(status: 'archived') }

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :remarks],
      [:name, :remarks, :email]
    ]
  end

end
