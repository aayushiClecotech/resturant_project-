class RestaurantsController < ApplicationController
   before_action :force_json, only: :search  

  load_and_authorize_resource
  
  def index 
    @restaurants = current_user.restaurants 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize! :read, @restaurant
  end 

  def new 
    @restaurant = current_user.restaurants.new 
  end 

  def create 
    @restaurant = current_user.restaurants.new(restaurant_params)

      respond_to do |format|
        format.js do 
          if @restaurant.save
              #if params[:images].present? 
                #@restaurant.images.attach(params[:images])
                #params[:restaurant][:images].each do |img|
                  @restaurants = current_user.restaurants

                  #@restaurant.images.create(images)
                #end
            #end 
            flash.now[:notice] = "Restaurant Create"
          else
           flash.now[:error] = "Restaurant not Create"
          end
        end 
      end
    end 

  def edit 
    @restaurant = Restaurant.find(params[:id])
  end 

  def update
    @restaurant = Restaurant.find(params[:id])
      respond_to do |format|
        format.js do 
          if @restaurant.update(restaurant_params) 
            @restaurants = current_user.restaurants
            flash.now[:notice] = "Restaurant Update"
          else
           flash.now[:error] = "Restaurant not update"
          end
        end 
      end
    end 

  def destroy 
   @restaurant = Restaurant.find(params[:id])
      respond_to do |format|
        format.js do 
          @restaurant.destroy 
          @restaurants = current_user.restaurants
          flash.now[:notice] = "Restaurant Delete"
        end
      end 
  end 

#   def google_map(center)
#   "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
# end

  # def search
  #   q = params[:q].downcase
  #   @restaurant = Restaurant.where("restaurant.name" "%#{q}%").limit(5)
  # end


  private 

  #  def force_json
  #   request.format = :json
  # end

  def restaurant_params 
    params.require(:restaurant).permit(:name, :Description, :image, :email, :contact_number, :full_address, images: [], videos: [])
  end 
end
