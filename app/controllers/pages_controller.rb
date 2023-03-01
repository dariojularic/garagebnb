class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @garages = @user.garages
    @bookings = @user.bookings
  end
end
