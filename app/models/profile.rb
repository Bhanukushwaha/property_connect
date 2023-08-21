class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, :mobile_number, :address, presence: true
  def profile_image    
    if Rails.env.production?
      return self.image.service_url rescue nil
    else
      return "" + Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
    end
  end
end
