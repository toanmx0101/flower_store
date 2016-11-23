class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.text :address
    	t.text :requirement
    	t.integer :phonenumber
    	t.boolean :status, default: false
      t.timestamps
    end
  end
end
