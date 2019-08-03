class CommentsController < ApplicationController
  def create 
    Comment.create(comment_params)
    redirect_to "/posts/#{params[:post_id]}"
  end  
  private
  def comment_params
    params.permit(:comment,:post_id,:user_id).merge(post_id: params[:post_id],user_id: current_user.id)
  end  
end
