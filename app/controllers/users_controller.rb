class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: :show

  def show
    @user = User.find(params[:id])
    @habbit = current_user.habbits.build
  end

  def edit
  end

  def update
     if current_user.update(user_params)
      flash.notice = "Successfully updated!"             
      redirect_to current_user
    else
      flash.now[:notice] = "Something went wrong... Try again"
      render 'edit'
    end
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to current_user if @user.nil?
  end

end
