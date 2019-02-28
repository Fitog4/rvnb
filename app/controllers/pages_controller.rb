require 'date'

class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard
  @booking_requests = BookingRequest.all.select { |request| request.date_till >= Date.today }
  end

  def dashboard_previous
  @booking_requests = BookingRequest.all.select { |request| request.date_till < Date.today }
  render :dashboard
  end

end
