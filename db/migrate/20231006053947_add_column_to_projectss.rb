class AddColumnToProjectss < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :country, :string
    add_column :properties, :postal_code, :integer
  end
end
