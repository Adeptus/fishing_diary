class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  def index
    @fish = Fish.all
  end

  def show
  end

  def new
    authorize! :create, Fish
    @fish = Fish.new
  end

  def edit
    authorize! :update, @fish
  end

  def create
    authorize! :create, Fish
    @fish = Fish.new(fish_params)

    if @fish.save
      redirect_to @fish, notice: _('Ryba zostało dodane')
    else
      render :new
    end
  end

  def update
    authorize! :update, @fish
    if @fish.update(fish_params)
      redirect_to @fish, notice: _('Ryba została edytowana')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @fish
    @fish.destroy
    redirect_to fish_index_url, notice: _('Ryba została usunięta')
  end

  private
    def set_fish
      @fish = Fish.find(params[:id])
    end

    def fish_params
      params.require(:fish).permit(:name, :description)
    end
end
