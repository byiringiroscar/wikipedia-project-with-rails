class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :string
      t.string :Photo
      t.string :string
      t.string :bio
      t.string :string
      t.string :UpdatedAt
      t.string :datetime
      t.string :CreatedAt
      t.string :datetime
      t.integer :PostCounter

      t.timestamps
    end
  end
end
