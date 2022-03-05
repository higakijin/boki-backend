class Lesson < ApplicationRecord
  belongs_to :level
  belongs_to :chapter
  has_many :outputs, dependent: :nullify
end
