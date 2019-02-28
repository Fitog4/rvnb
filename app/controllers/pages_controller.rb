class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard

  end

  def dashboard_previous
    render :dashboard
  end
end
