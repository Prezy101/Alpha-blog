class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 3).order(id: :desc)

  end


  def new
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

  def edit; end

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