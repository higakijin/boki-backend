class UserSerializer < ActiveModel::Serializer
  attributes %i[id name email level created_at updated_at avatar_url is_admin plan]

  has_many :outputs
end
