class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      response.status = 200
      redirect_to @post
    else
      # response.status = 302
      redirect_to root_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
