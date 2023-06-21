class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user&.posts
    unless @user
      flash.now[:error] = "User not found"
    end
  end

  def show; end
end
