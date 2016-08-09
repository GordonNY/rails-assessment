class Post < ActiveRecord::Base
	validates_presence_of :description

	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :followers, through: :comments, class_name: 'User'

	def self.my_posts(user_id)
		where(user_id: user_id).order(:created_at)
	end

	def category_name=(category_name)
		unless category_name.empty?
			category = Category.find_or_create_by(name: category_name)
			category.posts << self
		end
	end

	def category_name
		self.category ? self.category.name : ""
	end
end
