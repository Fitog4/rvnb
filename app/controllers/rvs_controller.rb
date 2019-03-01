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
    @searched_location = params[:query]
    @rvs = Rv.where(available_in: params[:query])
  end

  def filter_by_date
    if rv_search_params[:available_till].present?
      @rvs = Rv.where(available_in: params[:searched_location]).where('available_till >= ?', rv_search_params[:available_till])
    end

    if rv_search_params[:available_from].present?
      @rvs = @rvs.where('available_from <= ?', rv_search_params[:available_from])
    end
    render :search
  end

  private

  def rv_search_params
    params.require(:rv).permit(:available_from, :available_till)
  end

  def rv_params
    params.require(:rv).permit(:category, :travelling_seats, :beds, :available_in, :available_from, :available_till, :price_per_night, :model)
  end
end
