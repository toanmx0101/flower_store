class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_detail_id
      t.string :product_name
      t.string :product_type
      t.integer :product_details_code
      t.integer :quantity
      t.float :price
      
      t.timestamps
    end
  end
end
