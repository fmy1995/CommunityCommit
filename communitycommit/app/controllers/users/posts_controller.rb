class Users::PostsController < ApplicationController
    
def index
 @posts = Community.find(params[:community_id]).posts
 
end

def show
 @post = Post.find(params[:id])
 @post_comment = PostComment.new
 @post_comments = @post.post_comments
end    

private
def post_params
params.require(:post).permit(:admin_id, :community_id, :title, :post_text, :in_front, :image, :created_at, :updated_at )
end

end
