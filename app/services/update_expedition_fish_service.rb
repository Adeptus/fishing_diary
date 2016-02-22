class UpdateExpeditionFishService
  def initialize(expedition_fish, form)
    @expedition_fish = expedition_fish
    @form = form
  end

  def call
    return false unless @form.valid?
    update_expedition_fish
    update_catch_cache
  end

  private

  def update_expedition_fish
    @expedition_fish.update(@form.attributes)
  end

  def update_catch_cache
    UpdateCatchCacheService.new(
      @form.fish_id,
      @expedition_fish.expedition,
      [@form.method_id]
    ).call
  end
end
