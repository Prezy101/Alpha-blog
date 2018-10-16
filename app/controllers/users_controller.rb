class UsersController < ApplicationController

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

  private


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end