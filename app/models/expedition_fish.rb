class ExpeditionFish < ActiveRecord::Base
  belongs_to :expedition
  belongs_to :fish
end
