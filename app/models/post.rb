# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, as: :commentable
end
