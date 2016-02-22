class CatchMethodQuery < BaseQuery
  def results
    prepare_query
    order_results("name")
    paginate_result

    @results
  end

  private

  def prepare_query
    @results = CatchMethod
  end
end
