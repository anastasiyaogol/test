class SearchParams
	include ActiveModel::Model

	attr_accessor :dish
	attr_accessor :category
	attr_accessor :pricing_type

	def initialize(params)
		self.dish = params[:dish] if params.key?(:dish)
		self.category = params[:category] if params.key?(:category)
		self.pricing_type = params[:pricing_type] if params.key?(:pricing_type)

   	end

	def apply_filters(collection)
      	collection = collection.by_name(dish) unless dish.blank?
      	collection = collection.by_category_name(category)  unless category.blank?
      	collection = collection.by_pricing_type(pricing_type) unless pricing_type.blank?

		collection
	end
end