class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]


  def new
    @users = User.new
  end


  def create
    @users = User.new(user_params)
    if @users.save
      flash[:success] = 'Welcome to the alpha blog'
      redirect_to articles_path
    else
      render 'users/new' # or you can say render 'new'
    end
  end

  def edit; end

  def update
    if @users.update(user_params)
      flash[:success] = 'Profile successfully updated'
      redirect_to articles_path(@users)
    else
      render 'users/new'
    end
  end

  private

  def set_user
    @users = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end