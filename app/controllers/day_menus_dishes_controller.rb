class DayMenusDishesController < ApplicationController 
	def index
		@day_menu_dishes = DayMenusDish.all
		@search = DayMenusDishParams.new(params[:search_params] || {})
		@day_menu_dishes = @search.apply_filters(@day_menu_dishes)
 	end
end