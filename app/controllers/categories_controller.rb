class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @session = session[:user].inspect
    @categories = Category.all
  end

  def show
  end

  def edit
  end
  
  def update
    if @category.update(get_category_params) 
      redirect_to categories_path, info: "カテゴリーを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, info: "カテゴリーを削除しました"
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(get_category_params)
    if category.valid?
      category.save
      redirect_to categories_path, info: "カテゴリーが作成されました"
    else
      @category = category
      render 'new'
    end
  end


  private
  def get_category_params
    params.require(:category).permit(:title, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
