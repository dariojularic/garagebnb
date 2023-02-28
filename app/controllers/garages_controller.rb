class GaragesController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @garages = Garage.all
  end

  def new
    @garage = Garage.new
  end

  def show
    @garage = Garage.find(params[:id])
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.user = current_user
    if @garage.save
      redirect_to garages_path(@garage)
    else
      render :new
    end
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    @garage = Garage.find(params[:id])
    @garage.update(garage_params)
    redirect_to garages_path(@garage)
  end

  def destroy
    @garage = Garage.find(params[:id])
    @garage.destroy
    redirect_to garages_path
  end

  private

  def garage_params
    params.require(:garage).permit(:location, :description, :price)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
