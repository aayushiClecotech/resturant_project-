class AddRestaurantIdToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :restaurant_id, :integer
  end
end
