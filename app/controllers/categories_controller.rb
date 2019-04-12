class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update(get_category_params)
    redirect_to(categories_path)
  end

  def destroy
    @category = Category.find(params[:id])
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
end
