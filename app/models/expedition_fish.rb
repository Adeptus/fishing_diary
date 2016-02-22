class ExpeditionFish < ActiveRecord::Base
  belongs_to :expedition
  belongs_to :fish
  belongs_to :user
  belongs_to :bait
  belongs_to :method, class_name: 'CatchMethod'

  mount_uploader :image, ImageUploader
end
