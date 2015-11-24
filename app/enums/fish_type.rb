class FishType < ClassyEnum::Base
end

class FishType::Freshwater < FishType
  def index
    1
  end

  def text
    _("Słodkowodne")
  end
end

class FishType::Marine < FishType
  def index
    2
  end

  def text
    _("Morskie")
  end
end
