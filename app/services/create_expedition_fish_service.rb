class CreateExpeditionFishService
  def initialize(expedition, form)
    @expedition = expedition
    @form = form
  end

  def call
    return false unless @form.valid?
    save_image
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
      method_id,
      image,
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
      sprintf("%0.02f", random_weight),
      @form.notes.to_s,
      @form.user_id,
      @form.method_id,
      load_image,
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

  def update_catch_cache
    UpdateCatchCacheService.new(@form.fish_id, @expedition, [@form.method_id]).call
  end

  def save_image
    return unless @form.image
    uploader = ImageUploader.new(ExpeditionFish.new({expedition_id: @form.expedition_id}), :image)
    uploader.store!(@form.image)
  end

  def load_image
    return '' unless @form.image
    @form.image.original_filename
  end
end
