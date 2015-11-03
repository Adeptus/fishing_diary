class ExpeditionFish < ActiveRecord::Base
  belongs_to :expedition
  belongs_to :fish
  belongs_to :user
  belongs_to :bait
end
