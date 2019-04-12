class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(get_post_params)
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(get_post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: posts_path)
  end

  private
  def get_post_params
    params.require(:post).permit(:title, :content)
  end
end
