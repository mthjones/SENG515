class PostsController < ApplicationController
  def index
     @Posts = Post.all.reverse
      session[:return_to] = request.url
  end
  def show
      @post = Posts.find(params[:id])
      session[:return_to] = request.url
  end
  def new
  end
end
