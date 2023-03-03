class BookingsController < ApplicationController
  before_action :set_garage, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @garage = Garage.find(params[:garage_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garage = @garage
    @booking.user = current_user
    if @booking.save
      redirect_to garages_path, notice: "Your booking has been successful!"
    else
      redirect_to garage_path(@garage), alert: "#{@booking.errors.messages[:garagr].first}"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_garage
    @garage = Garage.find(params[:garage_id])
  end
end
