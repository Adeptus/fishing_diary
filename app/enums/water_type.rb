class WaterType < ClassyEnum::Base
end

class WaterType::Flowing < WaterType
  def index
    1
  end

  def text
    _("Płynąca")
  end
end

class WaterType::Standing < WaterType
  def index
    2
  end

  def text
    _("Stojąca")
  end
end
