class Review < ActiveRecord::Base
  validates :body, uniqueness: { scope: :product_id }
  belongs_to :product
end