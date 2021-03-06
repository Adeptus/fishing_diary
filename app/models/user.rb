class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expeditions
  has_many :expedition_fishes
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
