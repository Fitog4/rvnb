class RvsController < ApplicationController
  def show
    @rv = Rv.find(params[:id])
  end

  def new
    @rv = Rv.new
  end

  def create
    @rv = Rv.new(rv_params)
    @rv.user = current_user
    if @rv.save
      redirect_to rv_path(@rv)
    else
      render :new
    end
  end

  def search
    @rvs = Rv.near(rv_search_params[:available_in], 300).where('available_till >= ?', rv_search_params[:available_till]).where('available_from <= ?', rv_search_params[:available_from])
  end

  private

  def rv_search_params
    params.require(:rv).permit(:available_in, :available_from, :available_till)
  end

  def rv_params
    params.require(:rv).permit(:category, :travelling_seats, :beds, :available_in, :available_from, :available_till, :price_per_night, :model)
  end
end
