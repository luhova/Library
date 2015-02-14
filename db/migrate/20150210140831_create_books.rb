class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title
      t.text    :discription
      t.integer :rating
      t.integer :year
      t.integer :isbn
      t.integer :publisher_id

      t.timestamps null: false
    end

    add_index :books, :publisher_id
  end
end
