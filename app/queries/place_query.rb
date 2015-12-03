class PlaceQuery < BaseQuery
  attr_accessor :filters

  def results
    prepare_query
    search_result
    water_type_filter
    place_type_filter
    ability_filter
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