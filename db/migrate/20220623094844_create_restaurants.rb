class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :Description
      t.string :logo
      t.string :email
      t.integer :contact_number
      t.string :full_address
      t.integer :user_id

      t.timestamps
    end
  end
end
