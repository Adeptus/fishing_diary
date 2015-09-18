class BaitTypesController < ApplicationController
  before_action :set_bait_type, only: [:show, :edit, :update, :destroy]

  # GET /bait_types
  def index
    @bait_types = BaitType.all
  end

  # GET /bait_types/1
  def show
  end

  # GET /bait_types/new
  def new
    @bait_type = BaitType.new
  end

  # GET /bait_types/1/edit
  def edit
  end

  # POST /bait_types
  def create
    @bait_type = BaitType.new(bait_type_params)

    if @bait_type.save
      redirect_to @bait_type, notice: 'Bait type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bait_types/1
  def update
    if @bait_type.update(bait_type_params)
      redirect_to @bait_type, notice: 'Bait type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bait_types/1
  def destroy
    @bait_type.destroy
    redirect_to bait_types_url, notice: 'Bait type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bait_type
      @bait_type = BaitType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bait_type_params
      params.require(:bait_type).permit(:name)
    end
end
