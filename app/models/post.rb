class Post < ActiveRecord::Base
	validates_presence_of :description

	belongs_to :user
end
