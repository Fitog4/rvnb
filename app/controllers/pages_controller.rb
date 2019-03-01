require 'date'

class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard
     user_booking = BookingRequest.where(user: current_user)
     @booking_requests = user_booking.select { |request| request.date_till >= Date.today }
  end

  def dashboard_previous
   user_booking = BookingRequest.where(user: current_user)
     @booking_requests = user_booking.select { |request| request.date_till < Date.today }
     render :dashboard
  end
end
