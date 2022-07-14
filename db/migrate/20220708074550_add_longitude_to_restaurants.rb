class AddLongitudeToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :longitude, :decimal
  end
end
