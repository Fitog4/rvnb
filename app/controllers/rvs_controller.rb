class RvsController < ApplicationController
  def show
    @rv = Rv.find(params[:id])
  end

  def new
  end

  def create
    raise
  end

  def search
    @rvs = Rv.where(available_in: rv_search_params[:available_in])
      .where('available_till >= ?', rv_search_params[:available_till]).where('available_from <= ?', rv_search_params[:available_from])
  end

  private

  def rv_search_params
    params.require(:rv).permit(:available_in, :available_from, :available_till)
  end
end
# {"utf8"=>"✓", "rv"=>{"available_in"=>"Europe", "available_from"=>"2019-02-01", "available_till"=>"2019-02-16"}, "commit"=>"Search"}
