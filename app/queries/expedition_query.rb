class ExpeditionQuery < BaseQuery
  def results
    prepare_query
    ability_filter
    start_at_filter
    order_results('start_at')
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = Expedition
    @results = Expedition.joins(:place) if filters[:sort] ==['places.name']
  end

  def ability_filter
    return if filters[:user_id].blank?
    @results = @results
      .where('expeditions.private= :private OR expeditions.user_id= :user_id',
      { private: false, user_id: filters[:user_id] })
  end

  def start_at_filter
    if filters[:start_at_from].present? && filters[:start_at_to].present?
      @results = @results.where(start_at: filters[:start_at_from]..filters[:start_at_to])
    elsif filters[:start_at_from].present?
      @results = @results.where('start_at >= ?', filters[:start_at_from])
    elsif filters[:start_at_to].present?
      @results = @results.where('start_at <= ?', filters[:start_at_to])
    end
  end
end
