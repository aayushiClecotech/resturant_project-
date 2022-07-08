class Restaurant < ApplicationRecord 
	belongs_to :user 
	has_one_attached :image 
	#has_many :restaurant_images, dependent: :destroy
	has_many_attached :images
	has_many_attached :videos
	has_many :reviews , dependent: :destroy 

	searchable do
	   	 text :name 
	   	 text :full_address
	   	 text :Description
	end


	#accepts_nested_attributes_for :restaurant_images
end
