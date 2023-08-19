class Room < ApplicationRecord
	belongs_to :agent, class_name: "User", foreign_key: "agent_id"
	belongs_to :customer, class_name: "User", foreign_key: "user_id"
	has_many :messages, dependent: :destroy
	# validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  # after_create_commit {broadcast_append_to "rooms"}
end
