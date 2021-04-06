class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
