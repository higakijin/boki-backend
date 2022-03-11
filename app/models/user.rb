# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :tickets, dependent: :nullify
  belongs_to :level, optional: true
  has_many :outputs, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_one_attached :avatar # ActiveStorage

  def avatar_url
    avatar.service.send(:object_for, avatar.key).public_url if avatar.attached?
  end

  validates :name, uniqueness: true
  validates :email, uniqueness: true
end
