class Message < ApplicationRecord
	belongs_to :user
  belongs_to :room
	# after_create_commit { broadcast_append_to self.room }
	after_create :action_cable_broadcast
	def action_cable_broadcast
		ActionCable.server.broadcast "messages", {data: self}
	end
end
