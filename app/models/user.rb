class User < ApplicationRecord
  has_many :posts, foreign_key: :AuthorId
  has_many :likes, foreign_key: :AuthorId
  has_many :comments, foreign_key: :AuthorId
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
