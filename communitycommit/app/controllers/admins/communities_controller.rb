class Admins::CommunitiesController < ApplicationController
  def index
  @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.admin_id = current_admin.id
    if @community.save
    redirect_to admins_communities_path
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    @community.update(community_params)
    redirect_to admins_community_path(@community)
  end

  private
  def community_params
    params.require(:community).permit(:name, :introduction)
  end


end




