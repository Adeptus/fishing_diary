class ExpeditionFishForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :fish_id,
    :user_id,
    :expedition_id,
    :length,
    :weight,
    :bait_id,
    :notes
  )

  validates :fish_id, :length, :weight, presence: true

  def attributes
    {
    id: id,
    fish_id: fish_id,
    user_id: user_id,
    expedition_id: expedition_id,
    length: length,
    weight: weight,
    bait_id: bait_id,
    notes: notes
    }
  end
end