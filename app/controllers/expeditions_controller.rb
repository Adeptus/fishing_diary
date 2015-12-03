class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]

  def index
    @expeditions = Expedition.all
  end

  def show
    authorize! :read, @expedition
  end

  def new
    @form = ExpeditionForm.new
  end

  def create
    @form = ExpeditionForm.new(expedition_params)
    service = CreateExpeditionService.new(current_user, @form)
    if service.call
      redirect_to service.expedition, notice: _('Wyprawa została dodana')
    else
      render :new
    end
  end

  def edit
    authorize! :update, @expedition
    @form = ExpeditionForm.new(@expedition.attributes.except('created_at','updated_at'))
  end

  def update
    authorize! :update, @expedition
    @form = ExpeditionForm.new(@expedition.attributes.except('created_at','updated_at').merge(expedition_params))
    if @form.valid? && @expedition.update(@form.attributes)
      redirect_to @expedition, notice: _('Wyprawa została edytowana')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @expedition
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
      :temperature,
      :accessibility
    )
  end
end
