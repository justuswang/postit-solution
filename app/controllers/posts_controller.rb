class PostsController < ApplicationController
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
    # binding.pry
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "The post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :creator, :description)
  end
end
