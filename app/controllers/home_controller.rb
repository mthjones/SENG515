class HomeController < ApplicationController
  def index
    @workshops = Workshop.where("start_date >= ?", Date.today).order("start_date ASC").limit(5)
  end
end
