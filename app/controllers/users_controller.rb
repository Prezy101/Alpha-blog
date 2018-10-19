class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  before_action :require_user, only: [:edit]


  def index
    @users = User.paginate(page: params[:page], per_page: 3).order(id: :desc)

  end


  def new
    redirect_to articles_path if logged_in?
    @users = User.new
  end


  def create
    @users = User.new(user_params)
    if @users.save
      flash[:success] = 'Welcome to the alpha blog'
      redirect_to users_path
    else
      render 'users/new' # or you can say render 'new'
    end
  end

  def edit
    redirect_to users_path if current_user.id != @users.id
    flash[:danger] = 'You can only edit or delete your own profile'



  end

  def show
    @users = User.find(params[:id])

    @user_paginate = @users.articles.paginate(page: params[:page], per_page: 1)


  end

  def update
    if @users.update(user_params)
      flash[:success] = 'Profile successfully updated'
      redirect_to users_path
    else
      render 'users/new'
    end
  end

  def destroy
    @users.destroy
    flash[:danger] = 'User successfully deleted'
    redirect_to articles_path
  end
  private

  def set_user
    @users = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end