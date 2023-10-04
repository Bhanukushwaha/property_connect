class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :property_id
      t.string :name
      t.string :email
      t.decimal :price
      t.integer :phone_number
      t.string :addresses

      t.timestamps
    end
  end
end
