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
    :notes,
    :method_id
  )

  validates :fish_id, :count, :length, :weight, presence: true
  validates :count, numericality: { greater_than: 0 }
  validates :length, format: /\A[0-9]{1,3}(-[0-9]{1,3})?\z/
  validates :weight, format: /\A[0-9]{1,2}(,[0-9]{1,2})?(-[0-9]{1,2})?(,[0-9]{1,2})?\z/

  def attributes
    {
      fish_id: fish_id,
      user_id: user_id,
      length: length,
      weight: weight,
      bait_id: bait_id,
      notes: notes,
      method_id: method_id
    }
  end
end
