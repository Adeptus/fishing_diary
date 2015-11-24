class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]

  def index
    @expeditions = Expedition.all
  end

  def show
  end

  def new
    @expedition = current_user.expeditions.new
  end

  def edit
  end

  def create
    @expedition = current_user.expeditions.new(expedition_params)

    if @expedition.save
      redirect_to @expedition, notice: _('Wyprawa została dodana')
    else
      render :new
    end
  end

  def update
    if @expedition.update(expedition_params)
      redirect_to @expedition, notice: _('Wyprawa została edytowana')
    else
      render :edit
    end
  end

  def destroy
    @expedition.destroy
    redirect_to expeditions_url, notice: _('Wyprawa została usunięta')
  end

  private

  def set_expedition
    @expedition = Expedition.find(params[:id])
  end

  def expedition_params
    params.require(:expedition).permit(
      :start_at,
      :end_at,
      :place_id,
      :notes,
      :pressure,
      :showers,
      :overcast,
      :temperature
    )
  end
end
