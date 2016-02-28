class CatchMethodsController < ApplicationController
  before_action :set_catch_method, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    authorize! :read, Place
    @catch_methods = CatchMethodQuery.new(catch_methods_params).results
  end

  def show
    authorize! :read, Place
  end

  def new
    authorize! :create, Place
    @catch_method = CatchMethod.new
  end

  def create
    authorize! :create, Place
    @catch_method = CatchMethod.new(catch_method_params)

    if @catch_method.save
      redirect_to @catch_method, notice: 'Metoda połowu została dodana'
    else
      render :new
    end
  end

  def edit
    authorize! :update, @place
  end

  def update
    authorize! :update, @place
    if @catch_method.update(catch_method_params)
      redirect_to @catch_method, notice: 'Metoda połowu została edytowana'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @place
    @catch_method.destroy
    redirect_to catch_methods_url, notice: 'Metoda połowu została usunięta'
  end

  private
  def set_catch_method
    @catch_method = CatchMethod.find(params[:id])
  end

  def catch_method_params
    params.require(:catch_method).permit(:name, :fishing_type)
  end

  def catch_methods_params
    params.permit(:sort, :direction, :page)
  end

  def sort_column
    ['name'].include?(params[:sort]) ? params[:sort] : "name"
  end
end
