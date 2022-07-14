class Category < ApplicationRecord
	has_many :restaurant_categories, dependent: :destroy
	has_many :restaurants, through: :restaurant_categories
end
