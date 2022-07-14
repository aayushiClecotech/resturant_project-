class MenusController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.all 
    @menus = Menu.order(:position)
  end 

  def show 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
    authorize! :read, @menu 
  end 

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.new 
  end 

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.new(menu_params)
    if @menu.save 
      respond_to do |format|
        format.js{}
        # redirect_to restaurant_menus_path(@restaurant)
      end 
    # else 
    #   render :new
    end 
  end 

  def edit 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
  end 

  def update 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      respond_to do |format|
        format.js{}
        # redirect_to restaurant_menus_path(@restaurant)
      end 
    else 
      render :edit 
    end 
  end 

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
    @menu.destroy
      respond_to do |format|
        format.js{}
        # redirect_to restaurant_menus_path(@restaurant)
      end 
  end 

  def sort
  # accept the post with all the items to sort.
    params[:menu].each_with_index do |id, index|
      Menu.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  private 
    def menu_params 
      params.require(:menu).permit(:title, :description, :price, images: [])
    end 
end
