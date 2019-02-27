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
    @rvs = Rv.where(available_in: )
  end
end
