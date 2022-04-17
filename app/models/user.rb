class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  require 'carrierwave/orm/activerecord'       

  mount_uploader :avatar, AvatarUploader

  has_many :habbits, dependent: :destroy
  validates :name, presence: true
         
end
