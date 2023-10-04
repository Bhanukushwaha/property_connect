json.extract! order, :id, :user_id, :property_id, :name, :email, :price, :phone_number, :addresses, :created_at, :updated_at
json.url order_url(order, format: :json)
