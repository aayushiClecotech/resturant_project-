class HomeController < ApplicationController

      
  def index 
    @restaurants = Restaurant.all 

    if params[:search]
      @restaurants = Restaurant
        .search(params[:search])
        .order(:created_at => :desc)
    else 
      @restaurants = Restaurant
        .joins('LEFT JOIN reviews ON restaurants.id = reviews.restaurant_id')
        .group('restaurants.id')
        .order('AVG(reviews.rating) DESC NULLS LAST')
    end
  end

  def search 
     @search = Restaurant.search do
      fulltext params[:search]
    end
    @restaurants = @search.results
  end
end
