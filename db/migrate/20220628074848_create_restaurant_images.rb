class CreateRestaurantImages < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_images do |t|
      t.string :restaurant_image
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
