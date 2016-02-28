class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @places = PlaceQuery.new(places_params).results
  end

  def show
    authorize! :read, @place
    @expedition_fishes = ExpeditionFishQuery.new(expedition_fish_params).results
  end

  def new
    @form = PlaceForm.new
  end

  def create
    @form = PlaceForm.new(place_params.merge(user_id: current_user.id))

    if @form.valid?
      place = Place.create(@form.attributes)
      redirect_to place, notice: _('Łowisko zostało dodane')
    else
      render :new
    end
  end

  def edit
    authorize! :update, @place
    @form = PlaceForm.new(@place.attributes.except('created_at','updated_at'))
  end

  def update
    authorize! :update, @place
    @form = PlaceForm.new(@place.attributes.except('created_at','updated_at').merge(place_params))
    if @place.update(@form.attributes)
      redirect_to @place, notice: _('Łowisko zostało edytowane')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @place
    @place.destroy
    redirect_to places_url, notice: _('Łowisko zostało usunięte')
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(
      :place_type,
      :name,
      :notes,
      :address,
      :water_type,
      :private,
      :lat,
      :lng
    )
  end

  def places_params
    params.permit(
      :sort,
      :direction,
      :search,
      :water_type,
      :place_type
    ).merge(user_id: current_user.id)
  end

  def expedition_fish_params
    params.permit(
      :fish_id,
      :sort,
      :direction,
      :page,
      :method_id
    ).merge(place_id: @place.id)
  end

  def sort_column
    if params[:action] == "index"
      [
        'name',
        'place_type',
        'water_type'
      ].include?(params[:sort]) ? params[:sort] : "name"
    elsif params[:action] == 'show'
      [
        'length',
        'weight',
        'fish.name',
        'catch_methods.name',
        'users.username'
      ].include?(params[:sort]) ? params[:sort] : "length"
    end
  end
end
