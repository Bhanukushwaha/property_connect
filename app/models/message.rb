class Message < ApplicationRecord
	belongs_to :user
  belongs_to :room
  default_scope { order(created_at: :asc) }
  validates :content, presence: true
	# after_create_commit { broadcast_append_to self.room }
	after_create :action_cable_broadcast
	def action_cable_broadcast
		ActionCable.server.broadcast "messages", {data: self}
	end
end
