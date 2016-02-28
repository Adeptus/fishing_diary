class ExpeditionFishQuery < BaseQuery
  def results
    prepare_query
    fish_filter
    place_filter
    place_type_filter
    method_filter
    expedition_filter
    user_filter
    order_results("length")
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = ExpeditionFish
  end

  def method_filter
    return if filters[:method_id].blank?
    @results = @results.where(method_id: filters[:method_id])
  end

  def fish_filter
    return if filters[:fish_id].blank?
    @results = @results.where(fish_id: filters[:fish_id])
  end

  def place_filter
    return if filters[:place_id].blank?
    @results = @results
      .joins(:expedition)
      .where(expeditions: { place_id: filters[:place_id] })
  end

  def place_type_filter
    return if filters[:place_type].blank?
    @results = @results
      .joins(expedition: :place)
      .where(places: { place_type: filters[:place_type] })
  end

  def user_filter
    return if filters[:user_id].blank?
    @results = @results.where(user_id: filters[:user_id])
  end

  def expedition_filter
    return if filters[:expedition_id].blank?
    @results = @results.where(expedition_id: filters[:expedition_id])
  end

  def order_results(default)
    if filters[:sort] == 'fish.name'
      @results = @results..joins(:fish)
    elsif filters[:sort] == 'catch_methods.name'
      @results = @results.joins("LEFT OUTER JOIN catch_methods ON expedition_fishes.method_id = catch_methods.id")
    elsif filters[:sort] == 'users.username'
      @results = @results.joins(:user)
    elsif filters[:sort] == 'places.name'
      @results = @results.joins(expedition: :place)
    end

    super
  end
end
