class ReviewsController < ApplicationController
  def index 
     @restaurant = Restaurant.find(params[:restaurant_id])
     @reviews = Review.all
      respond_to do |format|
        format.js{}
      end
    # @review.user_id = current_user.id
  end 

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    # authorize! :read, @overview
  end 

  def new 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
    @review.user_id= current_user.id
  end  

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      PerformWorker.perform_async(current_user.id, @review.id, @restaurant.id)
      # ReviewMailer.with(user: current_user, review: @review, restaurant: @restaurant).deliver_now

        respond_to do |format|
          format.js{}
        end 
    else 
      render :new 
    end 
  end 

  def destroy 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    @review.destroy 

    respond_to do |format|
        format.js{}
    end  
  end  

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end 
end
