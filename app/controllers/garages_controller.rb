class GaragesController < ApplicationController
  # before_action :set_garage


  def index
    @garages = Garage.all
  end

  def new
    @garage = Garage.new
  end

  def show
    set_garage
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.user = current_user
    if @garage.save
      redirect_to garages_path(@garage)
    else
      render :new, status: :unproccesable_entity
    end
  end

  def edit
    set_garage
  end

  def update
    set_garage
    @garage.update(garage_params)
    redirect_to garages_path(@garage)
  end

  def destroy
    set_garage
    @garage.destroy
    redirect_to garages_path, status: :see_other
  end

  private

  def garage_params
    params.require(:garage).permit(:location, :description, :price)
  end

  def set_garage
    @garage = Garage.find(params[:id])
  end
end
