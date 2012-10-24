class PostsController < ApplicationController
  def index
     @Posts = Post.all.reverse
      session[:return_to] = request.url
  end
  def show
      @post = Post.find(params[:id])
      session[:return_to] = request.url
  end
  def new
  end
  def create
    
  end
  def edit
    if current_user_is_admin
      @post = Post.find(params[:id])
    else
      redirect_to new_user_session_path
    end 
  end
  def update
    if current_user_is_admin
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        flash[:success] = "Workshop successfully updated!"
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to status: 404
    end
  end
  def destroy
    
  end
end
