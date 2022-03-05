class OutputSerializer < ActiveModel::Serializer
  attributes %i[id post created_at updated_at user lesson]
end
