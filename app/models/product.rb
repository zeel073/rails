class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :product_price, presence: true
  validates :product_image, presence: true

  has_one_attached :product_image
end