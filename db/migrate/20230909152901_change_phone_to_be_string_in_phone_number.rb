class ChangePhoneToBeStringInPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :phone_number, :bigint
  end
end
