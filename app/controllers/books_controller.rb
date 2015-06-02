require_relative '../models/book'
require_relative '../views/books_view'
require_relative '../controllers/users_controller'


class BooksController
  class << self
    attr_accessor :isbn, :option

    def find
      BooksView.ask_for_isbn
      book = Book.find_by isbn: @isbn
      BooksView.display_book(book)
    end

    def pick_for_sort
      BooksView.ask_for_option
      Book.sort_books(option)
    end

    def all_books
      books = Book.all
      BooksView.display_books(books)
    end
  end
end