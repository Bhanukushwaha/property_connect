class Property < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy
	has_many :favourites, dependent: :destroy
	has_many_attached :images
	extend FriendlyId
  friendly_id :name, use: :slugged
  enum status_type: ["For Rent", "For Sale"]
end
