class ExpeditionsPresenter

  def catch_caches(expedition, methods = [])
    methods = [] if methods.nil?
    methods = [nil] if methods.all?(&:blank?)

    results = expedition.catch_caches
    results = results.where(method_id: methods) unless methods.blank?
    results.order('count desc')
  end

  def catch_methods(expedition, methods = [])
    methods = [] if methods.nil?
    methods = methods.delete_if(&:blank?)

    results = expedition.catch_caches.where.not(method: nil)
    results = results.where(method_id: methods) unless methods.blank?
    results.map(&:method)
  end
end
