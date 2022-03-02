# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :tickets, dependent: :nullify
  belongs_to :level
  has_many :finish_chapters, dependent: :nullify
  has_many :chapters, through: :finish_chapters
end
