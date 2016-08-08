class Post < ActiveRecord::Base
	validates_presence_of :description

	belongs_to :user
	has_many :comments

	def self.my_posts(user_id)
		where(user_id: user_id).order(:created_at)
	end
end
