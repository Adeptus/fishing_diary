class ExpeditionFishQuery < BaseQuery
  def results
    prepare_query
    fish_filter
    fishing_type_filter
    expedition_filter
    order_results("length")
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = ExpeditionFish.joins(:fish)
  end

  def fishing_type_filter
    return if filters[:fishing_type].blank?
    @results = @results.where(fishing_type: filters[:fishing_type])
  end

  def fish_filter
    return if filters[:fish_id].blank?
    @results = @results.where(fish_id: filters[:fish_id])
  end

  def expedition_filter
    return if filters[:expedition_id].blank?
    @results = @results.where(expedition_id: filters[:expedition_id])
  end
end
