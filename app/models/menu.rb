class Menu < ApplicationRecord
	belongs_to :restaurant
	has_many_attached :images 
	acts_as_list
end
