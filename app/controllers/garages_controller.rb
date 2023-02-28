class GaragesController < ApplicationController
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
      redirect_to garage_path(@garage)
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
    redirect_to garage_path(@garage)
  end

  def destroy
    @garage = Garage.find(params[:id])
    @garage.destroy
    redirect_to garages_path
  end
end
