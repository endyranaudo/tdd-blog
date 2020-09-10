class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      response.status = 200
      redirect_to @post
    else
      redirect_to root_url
    end
  end

  def edit
    @post = Post.find(params[:id])  
    if @post.user == current_user
      render "edit"
    else
      redirect_to root_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.update(post_params)
      redirect_to @post
    else
      redirect_to root_url
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  
  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
