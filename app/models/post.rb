class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
