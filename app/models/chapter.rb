class Chapter < ApplicationRecord
  belongs_to :level
  has_many :lessons

  validates :name, uniqueness: true
end
