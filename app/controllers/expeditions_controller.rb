class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @expeditions = ExpeditionQuery.new(expeditions_params).results
  end

  def show
    authorize! :read, @expedition
    @expedition_fishes = ExpeditionFishQuery.new(expedition_fish_params).results
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
      :accessibility,
      :water_temperature,
      :activity_type,
      :wind_strength,
      :wind_direction,
      :pressure_type
    )
  end

  def expeditions_params
    params.permit(
      :start_at,
      :direction,
      :sort,
      :start_at_from,
      :start_at_to,
      :place_id,
      :user_id,
      fish_ids: []
    ).merge(current_user_id: current_user.id)
  end

  def expedition_fish_params
    params.permit(
      :fish_id,
      :sort,
      :direction,
      :page,
      :method_id
    ).merge(expedition_id: @expedition.id)
  end

  def sort_column
    if params[:action] == "index"
      ['start_at', 'places.name', 'users.username'].include?(params[:sort]) ? params[:sort] : "start_at"
    elsif params[:action] == 'show'
      ['length', 'weight', 'fish.name', 'method.name'].include?(params[:sort]) ? params[:sort] : "length"
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
