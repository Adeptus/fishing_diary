class ExpeditionQuery
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

  def ability_filter
    return if filters[:user_id].blank?
    @results = @results.where('private= ? OR user_id= ?', false, filters[:user_id])
  end

  def paginate_result
    @results = @results.page(filters[:page])
  end
end