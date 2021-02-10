class Users::UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update, :show]
  def show
      @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_user_path(@user.id)
    else
      render :edit
    end
  end
  
    private

  def user_params
    params.require(:user).permit(:name,:postal,:adress,:phone_number,:email)
  end
  
end
