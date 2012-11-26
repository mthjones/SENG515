class PostsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]
  
  def index
    if current_user.try(:admin?)
      @posts = Post.all.reverse
    else
      @posts = Post.where("admin_only = ?", false).reverse
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Post successfully created!"
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post successfully updated!"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post successfully deleted!"
    redirect_to posts_url
  end
end
