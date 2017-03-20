class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :price, precision: 10, scale: 2, default: 0.0, null: false
    end
  end
end
