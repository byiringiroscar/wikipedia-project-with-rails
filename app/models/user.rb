class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true
  # validates :posts_counter
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # before_validation :initialize_posts_counter, on: :create_table

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  # private

  # def initialize_posts_counter
  #   self.posts_counter ||= 0
  # end
end
