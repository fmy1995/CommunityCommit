class Admins:: PostsController < ApplicationController
    
def index
 @posts = Community.find(params[:community_id]).posts
end

def show
end    

def new
 @post = Post.new
 @community = Community.find(params[:community_id])
end

def create
 @community = Community.find(params[:community_id])
 @post = Post.new(post_params)
 @post.admin_id = current_admin.id
 @post.community_id = @community.id
 if @post.save
 redirect_to admins_community_posts_path
 end
end 

def edit
end

def update
end

def destroy
 @community = Community.find(params[:community_id])
 post = @community.posts.find(params[:id])
 post.destroy
 redirect_to request.referer
end

private
def post_params
params.require(:post).permit(:admin_id, :community_id, :title, :post_text, :in_front, :image, :created_at, :updated_at )
end

end
