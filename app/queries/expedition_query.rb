class ExpeditionQuery < BaseQuery
  def results
    prepare_query
    ability_filter
    start_at_filter
    place_filter
    fish_filter
    user_filter
    order_results('start_at')
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = Expedition
    @results = Expedition.joins(:place) if filters[:sort] == 'places.name'
    @results = Expedition.joins(:user) if filters[:sort] == 'users.username'
  end

  def ability_filter
    return if filters[:current_user_id].blank?
    @results = @results
      .where('expeditions.private= :private OR expeditions.user_id= :user_id',
      { private: false, user_id: filters[:current_user_id] })
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

  def place_filter
    return if filters[:place_id].blank?
    @results = @results.where(place_id: filters[:place_id])
  end

  def fish_filter
    return if !filters[:fish_ids] || filters[:fish_ids].delete_if(&:blank?).blank?
    catches = CatchCache.where(fish_id: filters[:fish_ids], catchable_type: 'Expedition')
    @results = @results.where(id: catches.map(&:catchable_id))
  end

  def user_filter
    return if filters[:user_id].blank?
    @results = @results.where(user_id: filters[:user_id])
  end
end
