class BaitType < ActiveRecord::Base
  has_many :baits
  has_many :fish, through: :baits
end
