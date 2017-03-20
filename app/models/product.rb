class Product < ActiveRecord::Base
  validates :title, uniqueness: { message: 'Product already exists' }
  has_many :reviews
end