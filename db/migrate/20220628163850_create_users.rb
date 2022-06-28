class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.boolean :is_author, default: false
      t.timestamps
    end
  end
end
