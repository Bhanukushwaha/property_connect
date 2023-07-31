class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, :mobile_number, :address, presence: true
end
