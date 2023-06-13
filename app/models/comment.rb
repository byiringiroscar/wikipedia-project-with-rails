class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :AuthorId
  belongs_to :post, foreign_key: :PostId
end
