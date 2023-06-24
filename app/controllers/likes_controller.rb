class LikesController < ApplicationController
  def create
    @user = current_user
    @post = @user.posts.find(params[:post_id])

    @like = Like.new(user: @user, post: @post)
    if @like.save
      flash[:success] = 'Like created successfully!'
    else
      flash[:error] = 'Like not created'
    end

    redirect_to user_posts_path(@user.id)
  end
end
