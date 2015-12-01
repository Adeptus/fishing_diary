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
    :temperature
  )

  validates :start_at, :end_at, :place_id, presence: true

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
    temperature: temperature
    }
  end
end