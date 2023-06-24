class CommentsController < ApplicationController
  def create
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

  def comment_params
    params.require(:comment).permit(:text)
  end
end
