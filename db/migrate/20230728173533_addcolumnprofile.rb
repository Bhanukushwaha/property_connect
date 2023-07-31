class Addcolumnprofile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :mobile_number, :bigint
    add_column :profiles, :address, :string    
    remove_column :profiles, :email
  end
end
