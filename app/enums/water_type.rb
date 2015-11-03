class WaterType < ClassyEnum::Base
end

class WaterType::Flowing < WaterType
  def index
    1
  end

  def text
    _("Flowing")
  end
end

class WaterType::Standing < WaterType
  def index
    2
  end

  def text
    _("Standing")
  end
end
