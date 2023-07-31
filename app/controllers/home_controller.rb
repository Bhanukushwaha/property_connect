class HomeController < ApplicationController
	def index
		if current_user.present?
      if current_user.role != "admin"
        unless current_user&.profile&.is_complete
          redirect_to new_profile_path
        end
      end
    end
		@properties = Property.last(6)
		# if params[:status_type].present?
		# 	@properties = Property.where(status_type: params[:status_type])
		# end
		# if params[:status_type].present?
		# 	@properties = Property.where(status_type: params[:status_type])
		# end
	end
end