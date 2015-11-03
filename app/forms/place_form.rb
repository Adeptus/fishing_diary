class PlaceForm
  include ActiveModel::Model

  attr_accessor(
    :place_type,
    :name,
    :notes,
    :address,
    :water_type
  )

  validates :name, :place_type, :water_type, presence: true

  def attributes
    {
      place_type: place_type,
      name: name,
      notes: notes,
      address: address,
      water_type: water_type
    }
  end
end