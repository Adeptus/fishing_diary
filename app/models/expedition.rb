class Expedition < ActiveRecord::Base
  has_many :expedition_fishes, dependent: :destroy
  has_many :fishes, through: :expedition_fishes
  has_many :catch_caches, as: :catchable, class_name: 'CatchCache'

  belongs_to :place
  belongs_to :user
end
