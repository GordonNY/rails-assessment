class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	def self.for_post(id)
		where(post_id: id).order(:created_at)
	end
end
