class Fish < ActiveRecord::Base
  has_many :expedition_fishes
  has_many :expeditions, through: :expedition_fishes
end
