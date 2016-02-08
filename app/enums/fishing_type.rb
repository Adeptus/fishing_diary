class FishingType < ClassyEnum::Base
end

class FishingType::Float < FishingType
  def index
    1
  end

  def text
    _("Spławik")
  end
end

class FishingType::BottomFishing < FishingType
  def index
    2
  end

  def text
    _("Grunt")
  end
end

class FishingType::Spinning < FishingType
  def index
    3
  end

  def text
    _("Spinning")
  end
end

class FishingType::KarpFishing < FishingType
  def index
    4
  end

  def text
    _("Karpiówka")
  end
end
