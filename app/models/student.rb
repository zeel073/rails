# frozen_string_literal: true

class Student < ApplicationRecord
  include Visible
  has_many :reviews, dependent: :destroy

  def hello
    'hello delegate'
  end

  validates :rollNo, presence: true, numericality: { only_integer: true }
  validates :name, presence: true, length: { minimum: 2 }
  validates :remarks, presence: true, length: { minimum: 10 }
  validates :email, presence: true

  scope :privatezeel, -> { where(status: 'private') }
  scope :publiczeel, -> { where(status: ['public', nil]) }
  scope :archivedzeel, -> { where(status: 'archived') }
end
