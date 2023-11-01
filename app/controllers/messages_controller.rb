class MessagesController < ApplicationController
   
  skip_before_action :verify_authenticity_token
	def create
    @current_user = current_user
    @message = @current_user.messages.create(content: params[:message][:content], room_id: params[:room_id].to_i)
  end

  private
  def msg_params
    params.require(:message).permit(:content)
  end
end