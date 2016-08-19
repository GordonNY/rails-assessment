class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :posts, serializer: PostSerializer
end
