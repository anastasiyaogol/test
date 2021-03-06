class Category < ApplicationRecord
	has_many :dishes
	validates :name,presence:true,length:{minimum:2}
	def formatted_created_at
		created_at.strftime('%Y-%m-%d %H:%M:%S')
	end
end
