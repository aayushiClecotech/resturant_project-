class AddPositionToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :position, :integer
  end
end
