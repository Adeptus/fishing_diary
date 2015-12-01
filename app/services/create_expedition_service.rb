class CreateExpeditionService
  attr_reader :expedition

  def initialize(user, form)
    @user = user
    @form = form
  end

  def call
    return false unless @form.valid?
    save_expedition
  end

  private

  def save_expedition
    @expedition = @user.expeditions.create!(@form.attributes)
  end
end