class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
    @categories = Category.new
  end

  def create

    @categories = Category.new(category_params)
    if @categories.save
      flash[:success] = 'Category successfully created'
      redirect_to categories_path(@categories)

    else
      render 'new'
    end

  end

  def show

  end

  def edit

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

