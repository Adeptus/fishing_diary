class PlaceQuery
  attr_accessor :filters

  def initialize(user, filters = {})
    @user = user
    @filters = filters
  end

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

  def search_result
    return if filters[:search].blank?
    @results = @results.where('lower(name) LIKE ?', "%#{filters[:search].downcase}%")
  end

  def ability_filter
    return if @user.admin?
    @results = @results.where('private= ? OR user_id= ?', false, @user.id)
  end

  def water_type_filter
    return if filters[:water_type].blank?
    @results = @results.where(water_type: filters[:water_type])
  end

  def place_type_filter
    return if filters[:place_type].blank?
    @results = @results.where(place_type: filters[:place_type])
  end

  def order_results
    if filters[:sort]
      @results = @results.order(filters[:sort] + " " + filters[:direction])
    else
      @results = @results.order('name')
    end
  end

  def paginate_result
    @results = @results.page(filters[:page])
  end
end