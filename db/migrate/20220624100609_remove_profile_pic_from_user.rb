class RemoveProfilePicFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :profile_pic, :string
  end
end
