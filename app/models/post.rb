class Post < ApplicationRecord
  belongs_to :user, foreign_key: :AuthorId
  has_many :likes, foreign_key: :Postid
  has_many :comments, foreign_key: :PostId
end
