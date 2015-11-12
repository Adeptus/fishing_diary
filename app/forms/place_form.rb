class PlaceForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :place_type,
    :name,
    :notes,
    :address,
    :water_type,
    :user_id,
    :private,
    :lat,
    :lng
  )

  validates :name, :place_type, :water_type, :user_id, presence: true

  def attributes
    {
      place_type: place_type,
      name: name,
      notes: notes,
      address: address,
      water_type: water_type,
      user_id: user_id,
      lat: lat,
      lng: lng,
      private: private
    }
  end
end