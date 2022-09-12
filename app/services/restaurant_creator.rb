class RestaurantCreator 

	attr_accessor :category_ids , :restaurant 
	
	def initialize(category_ids: , restaurant:) 
		@category_ids = category_ids 
		@restaurant = restaurant
	end 

	def create_category 
		category_ids.each do |category|
      if category.present?
        restaurant.restaurant_categories.create(category_id: category)
      end 
    end 
  rescue ActiveRecord::RecordNotUnique => e
   # handle duplicate entry
  end 
end 
