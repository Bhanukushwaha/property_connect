class HomeController < ApplicationController
	before_action :check_profile
	def index
		# if current_user.present?
    #   if current_user.role != "admin"
    #     unless current_user&.profile&.is_complete
    #       redirect_to new_profile_path
    #     end
    #   end
    # end
    @users = User.agents.last(4)
		@properties = Property.where(is_approved: true).last(6)
		# if params[:status_type].present?
		# 	@properties = Property.where(status_type: params[:status_type])
		# end
		# if params[:status_type].present?
		# 	@properties = Property.where(status_type: params[:status_type])
		# end
	end
	def agent
		@user = User.find(params[:id])
	end
end
