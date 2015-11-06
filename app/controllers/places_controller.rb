class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.publicly(current_user)
  end

  def show
    authorize! :read, @place
  end

  def new
    @form = PlaceForm.new
  end

  def create
    @form = PlaceForm.new(place_params.merge(user_id: current_user.id))

    if @form.valid?
      place = Place.create(@form.attributes)
      redirect_to place, notice: _('Place was successfully created.')
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
      redirect_to @place, notice: _('Place was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @place
    @place.destroy
    redirect_to places_url, notice: _('Place was successfully destroyed.')
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:place_type, :name, :notes, :address, :water_type, :private)
    end
end
