class CreateExpeditionFishService
  def initialize(expedition, form)
    @expedition = expedition
    @form = form
  end

  def call
    return false unless @form.valid?
    create_expedition_fishes
    update_catch_cache
  end

  private

  def create_expedition_fishes
    ActiveRecord::Base.connection.execute "INSERT INTO expedition_fishes (
      fish_id,
      expedition_id,
      length,
      weight,
      notes,
      user_id,
      created_at,
      updated_at
    ) VALUES #{fishes_array.join(", ")}"
  end

  def fishes_array
    @form.count.to_i.times.collect do
      "('#{fish_attributes}')" # need format ('1','1','1','2','asdasdas','1','1','2016-01-02 20:17:21','2016-01-02 20:17:21')
    end
  end

  def fish_attributes
    [
      @form.fish_id,
      @expedition.id,
      random_length,
      random_weight,
      @form.notes.to_s,
      @form.user_id,
      DateTime.now.strftime('%F %T'),
      DateTime.now.strftime('%F %T')
    ].join("','") # return 1','1','1','2','asdasdas','1','1','2016-01-02 20:17:21','2016-01-02 20:17:21
  end

  def random_length #TODO: if more then one should take min one maximum and one minimum
    if @form.length.include?("-")
      elements = @form.length.split('-')
      rand(Range.new(elements[0].to_i, elements[1].to_i))
    else
      @form.length
    end
  end

  def random_weight #TODO: if more then one should take min one maximum and one minimum
    if @form.weight.include?("-")
      elements = @form.weight.split('-')
      range = Range.new(elements[0].gsub(',','.').to_f, elements[1].gsub(',','.').to_f)
      rand(range)* (1/0.05).round.to_f / (1/0.05)
    else
      @form.weight.gsub(',','.').to_f
    end
  end

  def update_catch_cache #TODO: move to UpdateCatchCacheService
    cache = CatchCache.where(fish_id: @form.fish_id, catchable: @expedition).first_or_initialize
    fishes = ExpeditionFish.where(expedition_id: @expedition.id, fish_id: @form.fish_id)
    length_max = fishes.maximum(:length)
    length_min = fishes.minimum(:length)
    weight_max = fishes.maximum(:weight)
    weight_min = fishes.minimum(:weight)
    cache.update(
      fish_id: @form.fish_id,
      count: fishes.count,
      length: "#{length_min}-#{length_max}",
      weight: "#{weight_min}-#{weight_max}",
      catchable: @expedition
    )
  end
end