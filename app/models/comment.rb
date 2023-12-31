class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
