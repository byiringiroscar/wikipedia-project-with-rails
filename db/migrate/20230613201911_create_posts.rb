class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :AuthorId
      t.string :integer
      t.string :Title
      t.string :string
      t.text :Text
      t.string :CreatedAt
      t.string :datetime
      t.string :UpdatedAt
      t.string :datetime
      t.string :CommentsCounter
      t.string :integer
      t.string :LikesCounter
      t.string :integer

      t.timestamps
    end
  end
end
