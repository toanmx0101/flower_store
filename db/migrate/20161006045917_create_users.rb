class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :address
      t.string :phone
      t.text :avatar
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin
      t.timestamps
    end
  end
end
