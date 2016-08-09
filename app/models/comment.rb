class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates_presence_of :content

	def self.for_post(id)
		where(post_id: id).order(:created_at)
	end
end
