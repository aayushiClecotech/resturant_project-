class AddVideosToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :videos, :string
  end
end
