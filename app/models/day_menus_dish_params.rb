class DayMenusDishParams
	include ActiveModel::Model

	attr_accessor :dish
	attr_accessor :date

	def initialize(params)
		self.dish = params[:dish] if params.key?(:dish)
		self.date = params[:date] if params.key?(:date)

   	end

	def apply_filters(collection)
      	collection = collection.by_dish(dish) unless dish.blank?
      	collection = collection.by_date(date)  unless date.blank?

		collection
	end
end