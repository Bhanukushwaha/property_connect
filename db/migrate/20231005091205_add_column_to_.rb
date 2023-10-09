class AddColumnTo < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :latitude, :decimal
    add_column :properties, :longitude, :decimal
  end
end
