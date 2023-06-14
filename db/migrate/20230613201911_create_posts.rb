class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author_id
      t.string :Title
      t.text :Text
      t.string :CreatedAt
      t.string :updated_at
      t.string :CommentsCounter
      t.string :LikesCounter

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
