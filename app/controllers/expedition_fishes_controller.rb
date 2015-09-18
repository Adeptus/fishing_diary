class ExpeditionFishesController < ApplicationController
  before_filter :find_expedition

  def new
    @expedition_fish = @expedition.expedition_fishes.new
  end

  def create
    @expedition_fish = @expedition.expedition_fishes.new(expedition_params)
    if @expedition_fish.save
      redirect_to @expedition_fish.expedition
    else
      render :new
    end
  end

  def destroy
    @expedition_fish = @expedition.expedition_fishes.find(params[:id])
    @expedition_fish.destroy
    redirect_to @expedition_fish.expedition
  end

  private

  def find_expedition
    @expedition = Expedition.find(params[:expedition_id])
  end

  def expedition_params
    params.require(:expedition_fish).permit(:fish_id, :expedition_id, :length, :weight, :bait_id, :notes)
  end
end
