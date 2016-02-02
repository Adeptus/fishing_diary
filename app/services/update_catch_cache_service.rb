class UpdateCatchCacheService
  def initialize(fish_id, catchable)
    @fish_id = fish_id
    @catchable = catchable
  end

  def call
    find_expedition_fishes
    update_cache
  end

  private

  def find_expedition_fishes
    @fishes = ExpeditionFish.where(expedition_id: @catchable.id, fish_id: @fish_id)
  end

  def update_cache
    cache = CatchCache.where(fish_id: @fish_id, catchable: @catchable).first_or_initialize
    cache.update(
      fish_id: @fish_id,
      count: @fishes.count,
      length: generate_length,
      weight: generate_weight,
      catchable: @catchable
    )
  end

  def generate_length
    length_max = @fishes.maximum(:length)
    length_min = @fishes.minimum(:length)
    if length_max == length_min
      length_max
    else
      "#{length_min}-#{length_max}"
    end
  end

  def generate_weight
    weight_max = @fishes.maximum(:weight)
    weight_min = @fishes.minimum(:weight)
    if weight_max == weight_min
      weight_max
    else
      "#{weight_min}-#{weight_max}"
    end
  end
end