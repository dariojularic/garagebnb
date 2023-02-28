class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @garage = Garage.find(params[:garage_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garage = Garage.find(params[:garage_id])
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end
end
