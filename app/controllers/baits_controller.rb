class BaitsController < ApplicationController
  before_action :set_bait, only: [:show, :edit, :update, :destroy]

  # GET /baits
  def index
    @baits = Bait.all
  end

  # GET /baits/1
  def show
  end

  # GET /baits/new
  def new
    @bait = Bait.new
  end

  # GET /baits/1/edit
  def edit
  end

  # POST /baits
  def create
    @bait = Bait.new(bait_params)

    if @bait.save
      redirect_to @bait, notice: 'Bait was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /baits/1
  def update
    if @bait.update(bait_params)
      redirect_to @bait, notice: 'Bait was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /baits/1
  def destroy
    @bait.destroy
    redirect_to baits_url, notice: 'Bait was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bait
      @bait = Bait.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bait_params
      params.require(:bait).permit(:producer_id, :taste, :color, :size, :bait_type_id, :shape)
    end
end
