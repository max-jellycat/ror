class PostsController < ApplicationController
  before_action :set_post, only: [:update, :edit, :show, :destroy]

  def index
    session[:user] = { username: "マクス", id: 4 }
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json do
        render json: @posts.as_json(only: [:title, :created_at, :id])
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(get_post_params)
      redirect_to posts_path, info: "記事を編集しました"
    else
      render 'edit'
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(get_post_params)
    if post.valid?
      post.save
      redirect_to posts_path, info: "記事が作成されました"
    else
      @post = post
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, info: "記事を削除しました"
  end

  private
  def get_post_params
    params.require(:post).permit(:title, :slug, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
