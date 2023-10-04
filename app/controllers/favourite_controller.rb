class FavouriteController < ApplicationController
	def my_favourite
		@favourites = current_user.favourites
	end
end
