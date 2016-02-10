class Showers < ClassyEnum::Base
end

class Showers::Absence < Showers
  def index
    1
  end

  def text
    _("Brak")
  end
end

class Showers::Drizzle < Showers
  def index
    2
  end

  def text
    _("Mżawka")
  end
end

class Showers::Rain < Showers
  def index
    3
  end

  def text
    _("Deszcz")
  end
end

class Showers::Storm < Showers
  def index
    4
  end

  def text
    _("Burza")
  end
end

class Showers::Snow < Showers
  def index
    5
  end

  def text
    _("Śnieg")
  end
end
