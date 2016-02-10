class ExpeditionFish < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  belongs_to :expedition
  belongs_to :fish
  belongs_to :user
  belongs_to :bait

  mount_uploader :image, ImageUploader
  classy_enum_attr :fishing_type, allow_blank: true, allow_nil: true
end
