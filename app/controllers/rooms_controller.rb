class RoomsController < ApplicationController
  def index
    if current_user.present?
      @property = Property.friendly.find_by(slug: params[:id])
      @agent = @property&.user
      if @agent.present?
        if current_user.id == @agent.id
        else
          @room = Room.find_or_initialize_by(user_id: current_user.id, agent_id: @agent.id)
          @room.save
          redirect_to room_path(@room.id)
        end
      end
      @rooms = current_user.rooms
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @room = Room.create(name: params[:name])
  end

  def get_msg
    @msg = Message.find_by(id: params[:msg_id])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    if ((@single_room.user_id == current_user.id) || (@single_room.agent_id == current_user.id))
      @rooms = current_user.rooms
      @message = Message.new
      render "index"
    else
      # flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path, notice: "You are not authorized to perform this action."
    end
  end
end
