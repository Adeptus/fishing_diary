class GroundbaitsController < ApplicationController
  before_action :set_groundbait, only: [:show, :edit, :update, :destroy]

  # GET /groundbaits
  def index
    @groundbaits = Groundbait.all
  end

  # GET /groundbaits/1
  def show
  end

  # GET /groundbaits/new
  def new
    @groundbait = Groundbait.new
  end

  # GET /groundbaits/1/edit
  def edit
  end

  # POST /groundbaits
  def create
    @groundbait = Groundbait.new(groundbait_params)

    if @groundbait.save
      redirect_to @groundbait, notice: 'Groundbait was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /groundbaits/1
  def update
    if @groundbait.update(groundbait_params)
      redirect_to @groundbait, notice: 'Groundbait was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groundbaits/1
  def destroy
    @groundbait.destroy
    redirect_to groundbaits_url, notice: 'Groundbait was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groundbait
      @groundbait = Groundbait.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def groundbait_params
      params.require(:groundbait).permit(:color, :groundbait_type, :taste)
    end
end
