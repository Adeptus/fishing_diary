class UpdateExpeditionFishForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :fish_id,
    :user_id,
    :length,
    :weight,
    :bait_id,
    :notes,
    :fishing_type,
    :image,
    :expedition_id
  )

  validates :fish_id, :length, :weight, presence: true
  validates :length, format: /\A[0-9]{1,3}\z/
  validates :weight, format: /\A[0-9]{1,2}([,.]{1}[0-9]{1,2})?\z/

  def attributes
    {
      fish_id: fish_id,
      user_id: user_id,
      length: length,
      weight: weight,
      bait_id: bait_id,
      notes: notes,
      fishing_type: fishing_type,
      image: image
    }
  end
end
