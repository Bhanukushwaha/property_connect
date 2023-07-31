class Addproperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :property_type, :string
    add_column :properties, :bedrooms, :integer
    add_column :properties, :bathrooms, :integer
    add_column :properties, :parking, :integer
  end
end
