class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.bigint :user_id
      t.bigint :room_id
      t.text :content

      t.timestamps
    end
  end
end
