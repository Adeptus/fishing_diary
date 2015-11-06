class Place < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  classy_enum_attr :water_type, default: :standing
  classy_enum_attr :place_type, default: :commercialism

  has_many :expeditions
  has_many :fishes, through: :expeditions
  has_many :expedition_fishes, through: :expeditions


  scope :publicly, -> (user) { where('private= ? OR user_id= ?', false, user.id) unless user.admin? }
end
