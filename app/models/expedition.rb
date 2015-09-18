class Expedition < ActiveRecord::Base
  has_many :expedition_fishes, dependent: :destroy
  has_many :fishes, through: :expedition_fishes

  belongs_to :place
end
