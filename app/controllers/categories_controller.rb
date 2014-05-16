class CategoriesController < ApplicationController
  before_action :set_catagory, only: [:edit, :update]
  before_action :set_cat

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Your category has been added."
      redirect_to 
    else
      render :new
    end

  end

  def edit; end

  def update

    if @category.update(category_params)
      flash[:notice] = "Your category has been updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def set_catagory
    @category = Category.find(params[:id])
  end
  
  def set_cat
    @categories = Category.all
  end
end
