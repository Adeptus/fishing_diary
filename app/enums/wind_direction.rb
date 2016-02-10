class WindDirection < ClassyEnum::Base
end

class WindDirection::North < WindDirection
  def index
    1
  end

  def text
    _("Północny(N)")
  end
end

class WindDirection::Northeast < WindDirection
  def index
    2
  end

  def text
    _("Północno-wschodni(NE)")
  end
end

class WindDirection::East < WindDirection
  def index
    3
  end

  def text
    _("Wschódni(E)")
  end
end

class WindDirection::Southeast < WindDirection
  def index
    4
  end

  def text
    _("Południowo-wschodni(SE)")
  end
end

class WindDirection::South < WindDirection
  def index
    5
  end

  def text
    _("Południowy(S)")
  end
end

class WindDirection::Southwest < WindDirection
  def index
    6
  end

  def text
    _("Południowo-zachodni(SW)")
  end
end

class WindDirection::West < WindDirection
  def index
    7
  end

  def text
    _("Zachódni(W)")
  end
end

class WindDirection::Northwest < WindDirection
  def index
    8
  end

  def text
    _("Północno-zachodni(NW)")
  end
end
