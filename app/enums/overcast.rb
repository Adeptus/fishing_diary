class Overcast < ClassyEnum::Base
end

class Overcast::Clear < Overcast
  def index
    1
  end

  def text
    _("Bezchmurnie")
  end
end

class Overcast::Low < Overcast
  def index
    2
  end

  def text
    _("Małe")
  end
end

class Overcast::Moderate < Overcast
  def index
    3
  end

  def text
    _("Umiarkowane")
  end
end

class Overcast::Big < Overcast
  def index
    4
  end

  def text
    _("Duże")
  end
end

class Overcast::Total < Overcast
  def index
    5
  end

  def text
    _("Całkowite")
  end
end
