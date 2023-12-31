class Admin::PropertiesController < ApplicationController
	before_action :set_property, only: %i[ show edit update destroy ]
	def index
		@properties = Property.all
	end

	def new
		@property = Property.new
	end

	def show
	end

	def edit
	end

	def create
		@property = Property.new(property_params)
		@property.status_type = params[:property][:status_type].to_i
    if @property.save
    	 @property.update(images: params[:property][:images].compact_blank)
      redirect_to admin_property_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
	end

	def update
		status_type = params[:property][:status_type].to_i			
    if @property.update(property_params.merge(status_type: status_type))
    	if params[:property][:images].compact_blank.present?
    		@property.update(images: params[:property][:images].compact_blank)
    	end
      redirect_to  admin_property_path(@property)
    else
      render :edit, status: :unprocessable_entity
    end
  end

	def destroy
    @property.delete
    respond_to do |format|
      format.html { redirect_to admin_properties_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	private
	 def set_property
	 	@property = Property.friendly.find(params[:id])
	 end

	 def property_params		
	 	params.require(:property).permit(:name,:description, :size, :price, :user_id, :amenities, :location, :latitude, :longitude, :city, :state, :country, :postal_code, :property_type, :bedrooms, :bathrooms, :parking, :is_approved)
	 end
end