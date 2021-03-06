class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @fish = FishQuery.new(fishes_params).results
  end

  def show
    @expedition_fishes = ExpeditionFishQuery.new(expedition_fish_params).results
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

  def fishes_params
    params.permit(
      :sort,
      :direction,
      :search,
      :fish_type
    )
  end

  def expedition_fish_params
    params.permit(
      :place_id,
      :sort,
      :direction,
      :page,
      :method_id,
      :place_type
    ).merge(fish_id: @fish.id)
  end

  def set_fish
    @fish = Fish.find(params[:id])
  end

  def fish_params
    params.require(:fish).permit(:name, :description, :fish_type)
  end

  def sort_column
    if params[:action] == 'index'
      ['name', 'fish_type'].include?(params[:sort]) ? params[:sort] : "name"
    elsif params[:action] == 'show'
      [
        'length',
        'weight',
        'places.name',
        'catch_methods.name',
        'users.username'
      ].include?(params[:sort]) ? params[:sort] : "length"
    end
  end
end
