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

    def display_books(books)
      if books.count == 0
        print "There aren't any books in the library yet"
      else
        books.each do |book|
          print "Title: #{book.title} - "
          print "Name of the author/s: "
          book.authors.each do |author|
            print "#{author.name} "
          end
          print "- "
          print "Genres: "
          book.genres.each do |genre|
            print  "#{genre.name} "
          end
          print "- "
          print "ISBN: #{book.isbn}"
          puts " "
        end
      end
    end

    def display_book(book)
      print "Title: #{book.title} - "
      print "Name of the author/s: "
      book.authors.each do |author|
        print "#{author.name} "
      end
      print "- "
      print "Description: #{book.description} - "
      print "Year of publishing: #{book.year} - "
      print "Rating: #{book.rating} - "
      print "Genres: "
      book.genres.each do |genre|
        print  "#{genre.name} "
      end
      print "- "
      print "ISBN: #{book.isbn}"
    end
  end
end