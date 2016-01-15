class BaseQuery
  attr_accessor :filters

  def initialize(filters = {})
    @filters = filters
  end

  protected

  def search_result(default = 'name')
    return if filters[:search].blank?
    @results = @results.where("CAST( lower(#{default}) AS text ) LIKE ?", "%#{filters[:search].downcase}%")
  end

  def ability_filter
    return if filters[:user_id].blank?
    @results = @results.where('private= ? OR user_id= ?', false, filters[:user_id])
  end

  def order_results(default = 'name')
    if filters[:sort]
      @results = @results.order(filters[:sort] + " " + filters[:direction])
    else
      @results = @results.order(default)
    end
  end

  def paginate_result
    @results = @results.page(filters[:page])
  end
end