require_relative '../models/book'
require_relative '../views/add_remove_books_view'
require_relative '../controllers/users_controller'

class AddRemoveBooksController
  class << self
  attr_accessor :book_title, :book_discription, :book_rating, :book_year, :book_isbn,
                :book_publisher, :authors_name, :authors_biography, :genres_name,
                :tags_name, :count

    def add_book
      AddRemoveBooksView.ask_for_title
      AddRemoveBooksView.ask_for_discription
      AddRemoveBooksView.ask_for_rating
      AddRemoveBooksView.ask_for_year
      AddRemoveBooksView.ask_for_isbn
      AddRemoveBooksView.ask_for_publisher
      new_book = Book.create(
        :title => @book_title,
        :discription => @book_discription,
        :rating => @book_rating,
        :year => @book_year,
        :isbn => @book_isbn
        )
      new_book.create_publisher(:name => @book_publisher)
      AddRemoveBooksView.ask_for_authors_count
      @count.to_i.times do
        AddRemoveBooksView.ask_for_authors
        new_book.authors.create(
          :name => @authors_name,
          :biography => @authors_biography
          )
      end
      AddRemoveBooksView.ask_for_genres_count
      @count.to_i.times do
        AddRemoveBooksView.ask_for_genres
        new_book.genres.create(:name => @genres_name)
      end
      AddRemoveBooksView.ask_for_tags_count
      @count.to_i.times do
        AddRemoveBooksView.ask_for_tags
        if @tags_name.include? ','
          puts "Tags can't include ','. Add the tag again. "
          AddRemoveBooksView.ask_for_tags
        else
          new_book.tags.create(:name => @tags_name)
        end
      end
    end

    def remove_book
      AddRemoveBooksView.ask_for_title
      book_to_remove = Book.find_by title: @book_title
      book_to_remove.destroy
    end
  end
end