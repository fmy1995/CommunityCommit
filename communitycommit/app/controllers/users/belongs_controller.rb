class Users:: BelongsController < ApplicationController
    
  def create
    community = Community.find(params[:community_id])
    belong = current_user.belongs.new(community_id: community.id)
    belong.save
    redirect_to users_community_path(community)  end

  def destroy
    community = Community.find(params[:community_id])
    belong = current_user.belongs.find_by(community_id: community.id)
    belong.destroy
    redirect_to users_community_path(community)  end
    
end
