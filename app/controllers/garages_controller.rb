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
      # flash[:notice] = render_to_string(partial: "shared/alert")
      sleep(0.8)
      redirect_to garages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_garage
  end

  def update
    set_garage
    @garage.update(garage_params)
    sleep(0.8)
    redirect_to garages_path, status: :see_other
  end

  def destroy
    set_garage
    @garage.destroy
    sleep(0.8)
    redirect_to garages_path, status: :see_other
  end

  private

  def garage_params
    params.require(:garage).permit(:city, :street, :description, :price, :photo)
  end

  def set_garage
    @garage = Garage.find(params[:id])
  end
end
