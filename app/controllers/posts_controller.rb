class PostsController < ApplicationController
  before_action :set_post, only: [:update, :edit, :show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
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
    @post.destroy
    redirect_back(fallback_location: posts_path)
  end

  private
  def get_post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
