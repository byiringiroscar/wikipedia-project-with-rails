class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user&.posts
    @posts = @user.posts.order(created_at: :desc)
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

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post created successfully!'
    else
      flash[:error] = 'Post not created'
    end

    redirect_back(fallback_location: user_path(params[:user_id]))
  end

  def destroy
    # logged in user
    @user = current_user
    @post = Post.find_by(id: params[:id])
    if can?(:destroy, @post)
      if @post
        @post.destroy
        flash[:success] = 'Post deleted successfully!'
      else
        flash[:error] = 'Post not found'
      end
      redirect_to user_posts_path(@user.id)
    else
      flash[:error] = 'You are not authorized to delete this post'
      redirect_to user_post_path(@post.user.id, @post.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  # def comment_params
  #   params.require(:comment).permit(:text)
  # end
end
