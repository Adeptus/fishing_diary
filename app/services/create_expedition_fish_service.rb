class CreateExpeditionFishService
  def initialize(expedition, form)
    @expedition = expedition
    @form = form
  end

  def call
    return false unless @form.valid?
    save_expedition_fishes
  end

  private

  def save_expedition_fishes
    ActiveRecord::Base.connection.execute "INSERT INTO expedition_fishes (
      fish_id,
      expedition_id,
      length,
      weight,
      notes,
      user_id,
      bait_id,
      created_at,
      updated_at
    ) VALUES #{fishes_array.join(", ")}"
  end

  def fishes_array
    @form.count.times.collect do
      "('#{fish_attributes}')" # need format ('1','1','1','2','asdasdas','1','1','2016-01-02 20:17:21','2016-01-02 20:17:21')
    end
  end

  def fish_attributes
    [
      @form.fish_id,
      @expedition.id,
      @form.length,
      @form.weight,
      @form.notes.to_s,
      @form.user_id,
      @form.bait_id,
      DateTime.now.strftime('%F %T'),
      DateTime.now.strftime('%F %T')
    ].join("','") # return 1','1','1','2','asdasdas','1','1','2016-01-02 20:17:21','2016-01-02 20:17:21
  end
end