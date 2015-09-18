class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]

  # GET /expeditions
  def index
    @expeditions = Expedition.all
  end

  # GET /expeditions/1
  def show
  end

  # GET /expeditions/new
  def new
    @expedition = Expedition.new
  end

  # GET /expeditions/1/edit
  def edit
  end

  # POST /expeditions
  def create
    @expedition = Expedition.new(expedition_params)

    if @expedition.save
      redirect_to @expedition, notice: 'Expedition was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /expeditions/1
  def update
    if @expedition.update(expedition_params)
      redirect_to @expedition, notice: 'Expedition was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /expeditions/1
  def destroy
    @expedition.destroy
    redirect_to expeditions_url, notice: 'Expedition was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedition
      @expedition = Expedition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expedition_params
      params.require(:expedition).permit(:start_at, :end_at, :place_id, :notes, :pressure, :showers, :overcast, :temperature)
    end
end
