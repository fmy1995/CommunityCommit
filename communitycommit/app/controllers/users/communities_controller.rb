class Users::CommunitiesController < ApplicationController
  def index
  @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end
  
  private
  def community_params
    params.require(:community).permit(:name, :introduction)
  end
end
