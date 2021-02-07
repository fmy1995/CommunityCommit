class Users::CommunitiesController < ApplicationController
  def index
  @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = Community.find(params[:id]).posts
    @questionaries = Questionary.all
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @communities = Community.search(params[:search])
  end
  
  private
  def community_params
    params.require(:community).permit(:name, :introduction)
  end
end
