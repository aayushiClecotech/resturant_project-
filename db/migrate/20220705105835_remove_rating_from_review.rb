class RemoveRatingFromReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :rating, :string
  end
end
