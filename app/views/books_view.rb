require 'colorize'
require_relative '../models/book'
require_relative '../controllers/books_controller'

class BooksView

  class << self

    def ask_for_option
      option = ""
      puts "Press 1 if you want the books to be sorted by the year of publishing."
      puts "Press 2 if you want the books to be sorted by their rating."
      option = gets.chomp
      BooksController.option = option
    end

    def ask_for_isbn
      puts "Enter the isbn value of the book you are looking for."
      BooksController.isbn = gets.chomp
    end
  end
end