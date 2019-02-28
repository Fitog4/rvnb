class PagesController < ApplicationController
  def home
    @rv = Rv.new
  end

  def dashboard

  end
end
