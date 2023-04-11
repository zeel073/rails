# frozen_string_literal: true

class User < ApplicationRecord
  has_one :userdetail, dependent: :destroy
  accepts_nested_attributes_for :userdetail
  has_one_attached :image
end
