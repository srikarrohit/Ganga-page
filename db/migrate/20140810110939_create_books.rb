class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false, limit: 30
      t.integer :pages
      t.text :description
      t.string :author, null: false, limit: 30
      t.boolean :borowed, null: false, default: false
      t.integer :user_id, null: true

      t.timestamps
    end
    add_index :books, :name
    add_index :books, :author
    add_index :books, [:name, :author], unique: true
  end
end
