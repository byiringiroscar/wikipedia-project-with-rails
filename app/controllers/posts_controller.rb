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

  def createcomment
    @user = current_user
    @post = @user.posts.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.author_id = @user.id
    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'Comment not created'
    end
    redirect_to user_post_path(@user.id, @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
