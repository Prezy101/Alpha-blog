class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3).order(id: :desc)
  end

  def new

    if admin_user
      redirect_to categories_path
    else
      @categories = Category.new

    end

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

  def require_admin
    if !logged_in? || (!logged_in? and current_user.admin?)
      flash[:danger] = 'Please note that only administrators can create categories'
      redirect_to categories_path

    end
  end

end

