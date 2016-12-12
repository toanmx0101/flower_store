class CreateProductDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :productdetails do |t|
      t.string :type_product
      t.integer :product_id
      t.string :code
      t.float :price                
      t.boolean :new      
      t.float :discount
      t.timestamps
    end
  end
end
