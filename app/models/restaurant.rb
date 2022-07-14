class Restaurant < ApplicationRecord 
	belongs_to :user 
	has_one_attached :image 
	#has_many :restaurant_images, dependent: :destroy
	has_many_attached :images
	has_many_attached :videos
	has_many :menus, dependent: :destroy

	has_many :reviews , dependent: :destroy 
	validates :email , presence: true

	searchable do
	   	 text :name 
	   	 text :full_address
	   	 text :Description
	end

	has_many :restaurant_categories, dependent: :destroy
	has_many :categories, through: :restaurant_categories

	#accepts_nested_attributes_for :restaurant_images
end
