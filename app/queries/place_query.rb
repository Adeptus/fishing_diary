class PlaceQuery < BaseQuery
  def results
    prepare_query
    water_type_filter
    place_type_filter
    ability_filter
    search_result
    order_results
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = Place
  end

  def water_type_filter
    return if filters[:water_type].blank?
    @results = @results.where(water_type: filters[:water_type])
  end

  def place_type_filter
    return if filters[:place_type].blank?
    @results = @results.where(place_type: filters[:place_type])
  end
end