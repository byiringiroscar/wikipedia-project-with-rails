class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id
  after_save :update_comments_counter

  private

  def update_comment_counter
    author.increment!(:comment_counter)
  end
end
