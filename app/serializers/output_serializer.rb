class OutputSerializer < ActiveModel::Serializer
  attributes %i[id post created_at updated_at lesson be_finished level_name_ja level_name_en chapter_order]
  belongs_to :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer

  def level_name_ja
    Level.find(object.lesson.level_id).name
  end

  def level_name_en
    if level_name_ja == '2級工業簿記'
      'second_industrial'
    elsif level_name_ja == '2級商業簿記'
      'second_commercial'
    end
  end

  def chapter_order
    object.lesson.chapter.order
  end
end
