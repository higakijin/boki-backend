class UserSerializer < ActiveModel::Serializer
  attributes %i[id name email level created_at updated_at]
end
