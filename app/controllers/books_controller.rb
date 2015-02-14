require_relative '../models/book'
require_relative '../views/books_view'
require_relative '../controllers/users_controller'


class BooksController
  class << self
    attr_accessor :isbn, :option

    def find
      BooksView.ask_for_isbn
      book = Book.find_by isbn: @isbn
      Book.display_book(book)
    end

    def sort
      BooksView.ask_for_option
      if(option == "1")
        Book.order(year: :desc)
      else
        Book.order(rating: :desc)
      end
    end

    def all_books
      Book.all_books
    end
  end
end