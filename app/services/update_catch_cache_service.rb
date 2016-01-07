class UpdateCatchCacheService
  def initialize(fish_id, catcheable)
    @fish_id = fish_id
    @catcheable = catcheable
  end

  def call
    find
  end

end