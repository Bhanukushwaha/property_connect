class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :rooms, class_name: "Room", foreign_key: "agent_id"
  belongs_to :company, optional: true
  scope :agents, -> { where role: "agent" }
  scope :customers, -> { where role: "customer" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  def is_admin?
   return true if self.role =="admin"
  end
end
