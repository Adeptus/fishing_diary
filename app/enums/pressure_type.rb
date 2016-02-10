class PressureType < ClassyEnum::Base
end

class PressureType::Constantly < PressureType
  def index
    1
  end

  def text
    _("Stałe")
  end
end

class PressureType::Rising < PressureType
  def index
    2
  end

  def text
    _("Rosnące")
  end
end

class PressureType::Decreasing < PressureType
  def index
    3
  end

  def text
    _("Malejące")
  end
end
