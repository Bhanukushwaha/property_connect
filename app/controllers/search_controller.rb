class SearchController < ApplicationController
	def index		
		@properties = Property.all
		if params[:status_type].present?
			@properties = @properties.where(status_type: params[:status_type])
		end
		if params[:property_type].present?
			@properties = @properties.where(property_type: params[:property_type])
		end
		if params[:location].present?
			@properties = @properties.where(location: params[:location])
		end
		if params[:bedrooms].present?
			@properties = @properties.where(bedrooms: params[:bedrooms])
		end		
		if params[:bathrooms].present?
			@properties = @properties.where(bathrooms: params[:bathrooms])
		end
	end
end