class Fish < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  classy_enum_attr :fish_type, default: :freshwater

  has_many :expedition_fishes, dependent: :destroy
  has_many :expeditions, through: :expedition_fishes

  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}
end
