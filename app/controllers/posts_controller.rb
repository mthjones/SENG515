class PostsController < ApplicationController
  def index
    if current_user.try(:admin?)
      @posts = Post.all.reverse
    else
      @posts = Post.where("admin_only = ?", false).reverse
    end
    session[:return_to] = request.url
  end
  def show
      @post = Post.find(params[:id])
      session[:return_to] = request.url
  end
  def new
    if current_user.try(:admin?)
      @post = Post.new
    else
      redirect_to new_user_session_path
    end
  end
  def create
    if current_user.try(:admin?)
      @post = Post.new(params[:post])
      if @post.save
        flash[:success] = "Post successfully created!"
        redirect_to @post
      else
        render 'new'
      end
    else
      redirect_to status: 404
    end
  end
  def edit
    if current_user.try(:admin?)
      @post = Post.find(params[:id])
    else
      redirect_to new_user_session_path
    end 
  end
  def update
    if current_user.try(:admin?)
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        flash[:success] = "Post successfully updated!"
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to status: 404
    end
  end
  def destroy
    if current_user.try(:admin?)
      Post.find(params[:id]).destroy
      flash[:success] = "Post successfully deleted!"
      redirect_to posts_url
    else
      redirect_to new_user_session_path
    end
  end
end
