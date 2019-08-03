class UsersController < ApplicationController
  before_action :move_to_index
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10).order("created_at DESC")
  end  
  def move_to_index
    redirect_to "/" unless user_signed_in?
  end
end
