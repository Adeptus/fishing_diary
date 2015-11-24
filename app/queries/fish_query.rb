class FishQuery
  attr_accessor :filters

  def initialize(user, filters = {})
    @user = user
    @filters = filters
  end

  def results
    prepare_query
    search_result
    fish_type_filter
    order_results
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = Fish
  end

  def search_result
    return if filters[:search].blank?
    @results = @results.where('lower(name) LIKE ?', "%#{filters[:search].downcase}%")
  end

  def fish_type_filter
    return if filters[:fish_type].blank?
    @results = @results.where(fish_type: filters[:fish_type])
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