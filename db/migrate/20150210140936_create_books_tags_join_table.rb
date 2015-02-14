class CreateBooksTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :books_tags, id: false do |t|
      t.integer :book_id
      t.integer :tag_id
    end

    add_index :books_tags, :book_id
    add_index :books_tags, :tag_id
  end
end
