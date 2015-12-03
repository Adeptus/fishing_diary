class FishQuery < BaseQuery
  attr_accessor :filters

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

  def fish_type_filter
    return if filters[:fish_type].blank?
    @results = @results.where(fish_type: filters[:fish_type])
  end
end