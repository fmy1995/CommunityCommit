class Admins:: PostsController < ApplicationController
   before_action :authenticate_admin!   
def index
 @posts = Community.find(params[:community_id]).posts.page(params[:page]).per(20)
 @community = Community.find(params[:community_id])
end

def show
 @post = Post.find(params[:id])
 @post_comments = @post.post_comments
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
 else
  flash[:notice] = "※タイトルを入れてください"
 render 'new'
 end
end 

def edit
 @post = Post.find(params[:id])
end

def update
 @post = Post.find(params[:id])
 if @post.update(post_params)
 redirect_to admins_community_post_path(@post)
 else
  flash[:notice] = "※タイトルを入れてください"
 render 'edit'
 end 
end

def destroy
 @community = Community.find(params[:community_id])
 post = @community.posts.find(params[:id])
 post.destroy
 redirect_to admins_community_posts_path
end

private
def post_params
params.require(:post).permit(:admin_id, :community_id, :title, :post_text, :in_front, :image, :created_at, :updated_at )
end

end
