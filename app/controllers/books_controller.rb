require_relative '../models/book'
require_relative '../views/books_view'
require_relative '../controllers/users_controller'
require 'erb'

class BooksController
  class << self
    attr_accessor :isbn, :option

    def find
      BooksView.ask_for_isbn
<<<<<<< Updated upstream
      book = Book.find_by isbn: @isbn
      Book.display_book(book)
=======
      book = Book.find_by_isbn @isbn
      BooksView.display_book(book)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      Book.all_books
=======
      books = Book.all
      BooksView.display_books
    end

    def all_books_web(argument)
      case argument
      when 'books'
        @books = Book.all
        erb = ERB.new(File.open("#{__dir__}/../views/index.html.erb").read, 0, '>')
        erb.result binding
      when 'sort_by_year'
        @books = Book.order(year: :desc)
        erb = ERB.new(File.open("#{__dir__}/../views/index.html.erb").read, 0, '>')
        erb.result binding
      when 'sort_by_rating'
        @books = Book.order(rating: :desc)
        erb = ERB.new(File.open("#{__dir__}/../views/index.html.erb").read, 0, '>')
        erb.result binding
      end
    end

    def find_book_web(isbn)
      @book = Book.find_by_isbn isbn
      if @book
        erb = ERB.new(File.open("#{__dir__}/../views/show.html.erb").read, 0, '>')
        erb.result binding
      else
        erb = ERB.new(File.open("#{__dir__}/../views/404.html.erb").read, 0, '>')
        erb.result binding
      end
    end

    def not_found
      erb = ERB.new(File.open("#{__dir__}/../views/404.html.erb").read, 0, '>')
      erb.result binding
>>>>>>> Stashed changes
    end
  end
end