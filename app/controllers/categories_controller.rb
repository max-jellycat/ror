class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end
  
  def update
    @category.update(get_category_params)
    redirect_to(categories_path)
  end

  def destroy
    @category.destroy
    redirect_back(fallback_location: categories_path)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(get_category_params)
    redirect_to(categories_path)
  end


  private
  def get_category_params
    params.require(:category).permit(:name, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
