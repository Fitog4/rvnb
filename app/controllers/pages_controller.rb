require 'date'

class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard
    user_booking = BookingRequest.where(user: current_user)
    @booking_requests = user_booking.select { |request| request.date_till >= Date.today }
  end

  def dashboard_rv_requests
    rv_requests = BookingRequest.all.select do |request|
      current_user.rvs.include?(request.rv)
    end
    @booking_requests = rv_requests.select { |request| request.date_from >= Date.today }
    render :dashboard
  end

  def dashboard_previous
    user_booking = BookingRequest.where(user: current_user)
    @booking_requests = user_booking.select { |request| request.date_till < Date.today }
    render :dashboard
  end

  def dashboard_prev_reqs_for_my_rvs
    rv_requests = BookingRequest.all.select do |request|
      current_user.rvs.include?(request.rv)
    end
    @booking_requests = rv_requests.select { |request| request.date_from < Date.today }
    render :dashboard
  end
end
