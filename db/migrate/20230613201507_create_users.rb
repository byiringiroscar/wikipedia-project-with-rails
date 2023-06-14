class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Photo
      t.string :bio
      t.string :updated_at
      t.string :CreatedAt
      t.integer :PostCounter

      t.timestamps
    end
  end
end
