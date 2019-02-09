class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :show, :destroy]


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

    @categories_articles = @categories.articles.paginate(page: params[:page], per_page: 1).order(id: :desc)

  end

  def edit

  end

  def update
    if @categories.update(category_params)
      flash[:success] = 'Category successfully created'
      redirect_to category_path(@categories)
    else
    render 'edit'
    end
  end

  def destroy
    @categories.destroy
    flash[:danger] = 'Category successfully deleted'
    redirect_to categories_path
  end

  private

  def set_category
    @categories = Category.find(params[:id])
  end

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

