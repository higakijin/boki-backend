class CommentSerializer < ActiveModel::Serializer
  attributes %i[id body created_at updated_at user_name avatar_url]

  def user_name
    object.user.name
  end

  def avatar_url
    object.user.avatar_url
  end
end
