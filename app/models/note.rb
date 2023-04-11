# frozen_string_literal: true

class Note < ApplicationRecord
  has_many :comments, as: :commentable
end
