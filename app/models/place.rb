class Place < ActiveRecord::Base
  has_many :expeditions
  has_many :fishes, through: :expeditions
  has_many :expedition_fishes, through: :expeditions
end
