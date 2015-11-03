class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @form = PlaceForm.new
  end

  def create
    @form = PlaceForm.new(place_params)

    if @form.valid?
      place = Place.create(@form.attributes)
      redirect_to place, notice: _('Place was successfully created.')
    else
      render :new
    end
  end

  def edit
    @form = @place #TODO: updateform object
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: _('Place was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url, notice: _('Place was successfully destroyed.')
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:place_type, :name, :notes, :address, :water_type)
    end
end
