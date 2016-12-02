class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :product_detail_id
      t.integer :quantity
      t.timestamps
    end
  end
end
