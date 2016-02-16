class ExpeditionForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :user_id,
    :start_at,
    :end_at,
    :place_id,
    :notes,
    :accessibility,
    :private,
    :hide_place,
    :activity_type,
    :showers,
    :overcast,
    :temperature,
    :water_temperature,
    :wind_strength,
    :wind_direction,
    :pressure,
    :pressure_type
  )

  validates :start_at, :end_at, :place_id, presence: true
  validates :temperature, numericality: {
    allow_blank: true,
    only_integer: true,
    greater_than: -30,
    less_than: 50
  }
  validates :water_temperature, numericality: {
    allow_blank: true,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 35
  }
  validates :pressure, numericality: {
    allow_blank: true,
    only_integer: true,
    greater_than: 950,
    less_than: 1060
  }
  validates :wind_strength, numericality: {
    allow_blank: true,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 120
  }

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
    hide_place: hide_place,
    water_temperature: water_temperature,
    activity_type: activity_type,
    wind_strength: wind_strength,
    wind_direction: wind_direction,
    pressure_type: pressure_type
    }
  end
end
