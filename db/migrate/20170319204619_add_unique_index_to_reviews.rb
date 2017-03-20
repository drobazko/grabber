class AddUniqueIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:product_id, :body], unique: true
  end
end
