class RestaurantImage < ApplicationRecord
  has_one_attached :restaurant_image
  belongs_to :restaurant
end
