class Property < ApplicationRecord
	belongs_to :user
	has_many :orders, dependent: :destroy
	has_many :favourites, dependent: :destroy
	has_many_attached :images
	geocoded_by :location
	after_validation :geocode
	extend FriendlyId
  friendly_id :name, use: :slugged
  enum status_type: ["For Rent", "For Sale"]
  
	# before_save :check_address
	# def check_address
	#  results = Geocoder.search(self.location)
	# lat_long = results.first.coordinates 
	#  errors.add(:location, "Address is not valid")
	# end
end

