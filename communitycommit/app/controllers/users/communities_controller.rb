class Users::CommunitiesController < ApplicationController
  def index
  @communities = Community.page(params[:page]).per(20)
  end

  def show
    @community = Community.find(params[:id])
    @posts = Community.find(params[:id]).posts.page(params[:page]).reverse_order.per(10)
    @questionaries = Questionary.page(params[:page]).reverse_order.per(5)
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
