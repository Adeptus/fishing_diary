class ExpeditionForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :user_id,
    :start_at,
    :end_at,
    :place_id,
    :notes,
    :pressure,
    :showers,
    :overcast,
    :temperature,
    :accessibility,
    :private,
    :hide_place
  )

  validates :start_at, :end_at, :place_id, presence: true

  def initialize(attributes = {})
    if attributes['accessibility']
      attributes[:private] = attributes['accessibility'] == 'private'
      attributes[:hide_place] = attributes['accessibility'] == 'hide_place'
    end
    super(attributes)
  end

  def attributes
    {
    id: id,
    user_id: user_id,
    start_at: start_at,
    end_at: end_at,
    place_id: place_id,
    notes: notes,
    pressure: pressure,
    showers: showers,
    overcast: overcast,
    temperature: temperature,
    private: private,
    hide_place: hide_place
    }
  end
end