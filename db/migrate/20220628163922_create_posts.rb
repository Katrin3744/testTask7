class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
