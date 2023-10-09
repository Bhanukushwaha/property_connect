class SearchController < ApplicationController
	def index
		if params[:location].present?
			@properties = Property.near([params[:latitude], params[:longitude]], params[:location])
		else
			conditions = {}
			conditions[:status_type] = params[:status_type] if params[:status_type].present?
			conditions[:property_type] = params[:property_type] if params[:property_type].present?
			# conditions[:location] = params[:location] if params[:location].present?
			conditions[:bedrooms] = params[:bedrooms] if params[:bedrooms].present?
			conditions[:bathrooms] = params[:bathrooms] if params[:bathrooms].present?
			@properties = Property.where(conditions)
	  end		
	end
end