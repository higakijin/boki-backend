class OutputSerializer < ActiveModel::Serializer
  attributes %i[id post created_at updated_at lesson]
  belongs_to :user, serializer: UserSerializer
end
