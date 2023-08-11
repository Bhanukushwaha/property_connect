class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :city
      t.float :price
      t.text :address
      t.string :property_type
      t.string :transaction_type
      t.integer :user_id

      t.timestamps
    end
  end
end
