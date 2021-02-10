class Admins:: UsersController < ApplicationController
    before_action :authenticate_admin!
  def show
      @user = User.find(params[:id])
  end

    private

  def user_params
    params.require(:user).permit(:name,:postal,:adress,:phone_number,:email)
  end
  
end
