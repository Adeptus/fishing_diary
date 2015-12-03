class ExpeditionQuery < BaseQuery
  attr_accessor :filters

  def initialize(filters = {})
    @filters = filters
  end

  def results
    prepare_query
    ability_filter
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = Expedition
  end
end