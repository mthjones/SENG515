class HomeController < ApplicationController
  def index
    @workshops = Workshop.where("start_date >= ?", Date.today).order("start_date ASC").limit(5)
    if current_user.try(:admin?)
      @posts = Post.order("created_at DESC").limit(5)
    else
      @posts = Post.order("created_at DESC").where("admin_only = ?", false).limit(5)
    end
  end
end
