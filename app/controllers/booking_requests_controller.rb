class BookingRequestsController < ApplicationController
  before_action :set_rv

  def new
    @booking_request = BookingRequest.new
  end

  def show
    @booking_request = BookingRequest.find(params[:id])
  end

  def create
    @booking_request = BookingRequest.new(booking_request_params)
    @booking_request.location = @rv.available_in
    @booking_request.rv = @rv
    @booking_request.user = current_user
    if @booking_request.save
      redirect_to rv_booking_request_path(@rv, @booking_request)
    else
      render :new
    end
  end

  private

  def set_rv
    @rv = Rv.find(params[:rv_id])
  end

  def booking_request_params
    params.require(:booking_request).permit(:date_from, :date_till)
  end
end
