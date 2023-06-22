class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user&.posts
    return if @user

    flash.now[:error] = 'User not found'
  end

  def show
    @user = User.find_by(id: params[:user_id])
    if @user
      @post = @user.posts.find_by(id: params[:id])
      flash.now[:error] = 'Post not found' unless @post
    else
      flash.now[:error] = 'User not found'
    end
  end
end
