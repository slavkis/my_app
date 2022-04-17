class HabbitsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :show, :index, :destroy]

  def index
    @habbits = Habbit.where(user_id: current_user.id)
  end 

  def new
    @habbit = Habbit.new
  end  

  def create
    @habbit = current_user.habbits.create(habbit_params) 

    if @habbit.save
      redirect_to user_habbits_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @habbit = current_user.habbits.find(params[:id])
  end
  
  
  def destroy
    @habbit = current_user.habbits.find(params[:id]).destroy
    redirect_to "/users/:id/habbits"
  end 
  
  private

    def habbit_params
      params.require(:habbit).permit(:name)
    end 

end
