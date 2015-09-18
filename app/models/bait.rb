class Bait < ActiveRecord::Base
  belongs_to :producer
  belongs_to :bait_type
  has_many :expedition_fishes
  has_many :fish, through: :expedition_fishes
end
