class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard
    @booking_requests = BookingRequest.all
  end
end
