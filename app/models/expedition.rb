class Expedition < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  has_many :expedition_fishes, dependent: :destroy
  has_many :fishes, through: :expedition_fishes
  has_many :catch_caches, as: :catchable, class_name: 'CatchCache', dependent: :destroy

  belongs_to :place
  belongs_to :user

  classy_enum_attr :overcast, allow_nil: true, allow_blank: true
  classy_enum_attr :showers, allow_nil: true, allow_blank: true
  classy_enum_attr :wind_direction, allow_nil: true, allow_blank: true
  classy_enum_attr :pressure_type, allow_nil: true, allow_blank: true
end
