class Addcoumnproperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :is_approved, :boolean, default: false
  end
end
