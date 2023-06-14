class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :author_id
      t.string :post_id
      t.text :Text
      t.datetime :updated_at
      t.datetime :CreatedAt

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
