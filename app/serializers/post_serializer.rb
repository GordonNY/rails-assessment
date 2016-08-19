class PostSerializer < ActiveModel::Serializer
  attributes :id, :description, :content, :user_id, :category_id
end
