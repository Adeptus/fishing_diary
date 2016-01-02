class ExpeditionFishForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :count,
    :fish_id,
    :user_id,
    :length,
    :weight,
    :bait_id,
    :notes
  )

  validates :fish_id, :count, :length, :weight, presence: true
  validates :count, numericality: { greater_than: 0 }
  validates :length, format: /\A[0-9]{1,3}(-[0-9]{1,3})?\z/
  validates :weight, format: /\A[0-9]{1,2}(,[0-9]{1,2})?(-[0-9]{1,2})?(,[0-9]{1,2})?\z/
end