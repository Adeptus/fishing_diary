class DestroyExpeditionFishesService
  def initialize(expedition, fish_ids)
    @expedition = expedition
    @fish_ids = fish_ids
  end

  def call
    if destroy_expedition_fishes
      update_catch_cache
      true
    else
      false
    end
  end

  private

  def destroy_expedition_fishes
    expedition_fishes = @expedition.expedition_fishes.where(id: @fish_ids)
    @fish_ids = expedition_fishes.pluck(:fish_id)
    expedition_fishes.destroy_all
  end

  def update_catch_cache
    @fish_ids.each do |fish_id|
      UpdateCatchCacheService.new(fish_id, @expedition).call
    end
  end
end