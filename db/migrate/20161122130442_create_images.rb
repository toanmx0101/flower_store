class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :link
     	t.references :product, foreign_key: true
      # t.integer :product_id
      t.timestamps
    end
    add_index :images, [:product_id, :created_at]
  end
end
