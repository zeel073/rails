# frozen_string_literal: true

class Reel < ApplicationRecord
  has_many :comments, as: :commentable
end
