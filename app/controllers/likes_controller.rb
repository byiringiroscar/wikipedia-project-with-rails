class LikesController < ApplicationController
  def create
    @user = current_user
    @post = @user.posts.find(params[:id])

    @like = Like.new(user: @user, post: @post)
    if @like.save
      @like.update_likes_counter
      flash[:success] = 'Like created successfully!'

    else
      flash[:error] = 'Like not created'
    end
    redirect_to user_posts_path(@user.id)
  end
end
