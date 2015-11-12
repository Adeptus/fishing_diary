class PlaceType < ClassyEnum::Base
end

class PlaceType::Commercialism < PlaceType
  def index
    1
  end

  def text
    _("Komercyjne")
  end
end

class PlaceType::PZW < PlaceType
  def index
    2
  end

  def text
    _("PZW")
  end
end

class PlaceType::Wild < PlaceType
  def index
    3
  end

  def text
    _("Dzikie")
  end
end

class PlaceType::Section < PlaceType
  def index
    4
  end

  def text
    _("Woda sekcyjna")
  end
end

class PlaceType::Private < PlaceType
  def index
    5
  end

  def text
    _("Prywatna")
  end
end
