class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  after_save :update_posts_counter
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
