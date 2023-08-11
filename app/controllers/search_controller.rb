class SearchController < ApplicationController
	def index
		conditions = {}
		conditions[:status_type] = params[:status_type] if params[:status_type].present?
		conditions[:property_type] = params[:property_type] if params[:property_type].present?
		conditions[:location] = params[:location] if params[:location].present?
		conditions[:bedrooms] = params[:bedrooms] if params[:bedrooms].present?
		conditions[:bathrooms] = params[:bathrooms] if params[:bathrooms].present?
		@properties = Property.where(conditions)	
		# @properties = Property.all
		# if params[:status_type].present?
		# 	@properties = @properties.where(status_type: params[:status_type])
		# end
		# if params[:property_type].present?
		# 	@properties = @properties.where(property_type: params[:property_type])
		# end
		# if params[:location].present?
		# 	@properties = @properties.where(location: params[:location])
		# end
		# if params[:bedrooms].present?
		# 	@properties = @properties.where(bedrooms: params[:bedrooms])
		# end		
		# if params[:bathrooms].present?
		# 	@properties = @properties.where(bathrooms: params[:bathrooms])
		# end
	end
end