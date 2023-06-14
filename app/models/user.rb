class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
