class Level < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :chapters, dependent: :nullify
  has_many :lessons, dependent: :nullify
end
