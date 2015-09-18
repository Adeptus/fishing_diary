class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  # GET /fish
  def index
    @fish = Fish.all
  end

  # GET /fish/1
  def show
  end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish
  def create
    @fish = Fish.new(fish_params)

    if @fish.save
      redirect_to @fish, notice: 'Fish was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fish/1
  def update
    if @fish.update(fish_params)
      redirect_to @fish, notice: 'Fish was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fish/1
  def destroy
    @fish.destroy
    redirect_to fish_index_url, notice: 'Fish was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fish_params
      params.require(:fish).permit(:name, :description)
    end
end
