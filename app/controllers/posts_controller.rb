class PostsController < ApplicationController
  before_action :move_to_index,except: [:index,:show]
  def new
    @post = Post.new
  end
  def create
    @post = Post.create(create_params)
    redirect_to "/"
  end
  def update

    @post = Post.find(params[:id])
    @post.update(update_params)
    redirect_to "/posts/#{params[:id]}"
  end  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order("")
  end
  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
  end
  def edit
    @post = Post.find(params[:id])
  end  
  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy if user_signed_in? && current_user.id == post.user_id.to_i
    
    redirect_to "/"
  end  
  private
  def create_params
   
    params.require(:post).permit(:text,:title,:user_id,:page).merge(user_id: current_user.id)
  end  
  def update_params
    params.require(:post).permit(:text,:title,:page)
  end  
  def move_to_index
    redirect_to "/" unless user_signed_in?
  end
end
