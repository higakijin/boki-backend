class Chapter < ApplicationRecord
  belongs_to :level
  has_many :lessons
  has_many :finish_chapters, dependent: :nullify
  has_many :users, through: :finish_chapters
end
