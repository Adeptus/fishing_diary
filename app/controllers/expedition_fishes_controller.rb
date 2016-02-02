class ExpeditionFishesController < ApplicationController
  before_filter :find_expedition
  before_filter :find_expedition_fish, only: [:edit, :update, :destroy]

  def new
    authorize! :update, @expedition
    @form = ExpeditionFishForm.new
  end

  def create
    authorize! :update, @expedition
    @form = ExpeditionFishForm.new(expedition_params)
    service = CreateExpeditionFishService.new(@expedition, @form)
    if service.call
      redirect_to @expedition, notice: _("Ryba została dodana")
    else
      render :new
    end
  end

  def edit
    authorize! :update, @expedition
    @form = ExpeditionFishForm.new(@expedition_fish.attributes.except('created_at','updated_at'))
  end

  def update
    authorize! :update, @expedition
    @form = ExpeditionFishForm.new(@expedition_fish.attributes.except('created_at','updated_at').merge(expedition_params))
    if @form.valid? && @expedition_fish.update(@form.attributes)
      redirect_to @expedition, notice: _("Ryby zostały edytowane")
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @expedition
    service = DestroyExpeditionFishesService.new(@expedition, [@expedition_fish.id])
    if service.call
      redirect_to @expedition, notice: _('Ryby została usuięte')
    else
      redirect_to @expedition, alert: _('Nie udało się usunąć ryby')
    end
  end

  def destroy_selected
    authorize! :destroy, @expedition
    service = DestroyExpeditionFishesService.new(@expedition, params[:fish_ids])
    if service.call
      redirect_to @expedition, notice: _('Zaznaczone ryby zostały usuięte')
    else
      redirect_to @expedition, alert: _('Nie udało się usunąć złapanych ryb')
    end

  end

  private

  def find_expedition
    @expedition = Expedition.find(params[:expedition_id])
  end

  def find_expedition_fish
    @expedition_fish = @expedition.expedition_fishes.find(params[:id])
  end

  def expedition_params
    params.require(:expedition_fish).permit(
      :fish_id,
      :expedition_id,
      :length,
      :weight,
      :bait_id,
      :notes,
      :count
    ).merge(user_id: current_user.id)
  end
end
