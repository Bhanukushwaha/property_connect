class CreateFeadbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feadbacks do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :city
      t.text :desctription

      t.timestamps
    end
  end
end
