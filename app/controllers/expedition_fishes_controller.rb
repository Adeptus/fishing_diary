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
    if @form.valid? && @expedition.expedition_fishes.create(@form.attributes)
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
    authorize! :update, @expedition
    @expedition_fish.destroy
    redirect_to @expedition_fish.expedition
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
      :notes
    )
  end
end
