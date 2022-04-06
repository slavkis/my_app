class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
     if current_user.update(user_params)
      flash[:success] = "Successfully updated!"
      redirect_to current_user
    else
      flash[:info] = "Something went wrong... Try again"
      render 'edit' 
    end
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end
