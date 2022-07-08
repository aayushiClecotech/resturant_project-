class RemoveLogoFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :logo, :string
  end
end
