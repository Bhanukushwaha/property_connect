class ProfilesController < ApplicationController
	before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
	skip_before_action :check_profile
	before_action :set_profile, only: %i[ show edit update destroy ]
	# def index
	# end

	def new
		@profile = Profile.new
	end

	def show
	end

	def edit
	end

	def reset_password
		if current_user.valid_password?(params[:old_password])
			if (params[:new_password] == params[:confirm_new_password])
				@users = current_user.update(password: params[:new_password])
			else
				notice = "You have not mech confirm_new_password"
			end
		else
			notice = "You have not mech password"
		end
	 end

	def change_password
	end

	def my_account
		if current_user.profile.present?
			@profile = current_user.profile
		else
			@profile = Profile.new
		end
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
    if @profile.save
			@profile.is_complete = true
			@profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to my_account_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_properties
  	@properties = current_user.properties
  end

  private
  def set_profile
  	@profile = Profile.find(params[:id])
  end
  def profile_params
  	params.require(:profile).permit(:name, :address, :mobile_number, :image, :about)
  end
end
