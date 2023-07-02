class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.author_id = @user.id
    if @comment.save
      flash[:success] = 'Comment created successfully!'
    else
      flash[:error] = 'Comment not created'
    end
    redirect_to user_post_path(@post.user.id, @post.id)
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    if can?(:destroy, @comment)
      if @comment
        @comment.destroy
        flash[:success] = 'Comment deleted successfully!'
      else
        flash[:error] = 'Comment not found'
      end
    else
      flash[:error] = 'You are not authorized to delete this comment'
    end
    redirect_to user_post_path(@post.user.id, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
