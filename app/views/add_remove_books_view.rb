require_relative '../controllers/add_remove_books_controller'

class AddRemoveBooksView
  class << self
    def ask_for_information
      puts "Add the title of the book: "
      AddRemoveBooksController.book_title = gets.chomp
      puts "Add a little description of the book: "
      AddRemoveBooksController.book_description = gets.chomp
      puts "What is the rating of the book?"
      AddRemoveBooksController.book_rating = gets.chomp
      puts "Add the year of publishing: "
      AddRemoveBooksController.book_year = gets.chomp
      puts "Enter the unique numeric book identifier: "
      AddRemoveBooksController.book_isbn = gets.chomp
      puts "Add the publisher of the book: "
      AddRemoveBooksController.book_publisher = gets.chomp
    end


    def ask_for_authors
      puts "Add the name of the author: "
      AddRemoveBooksController.authors_name = gets.chomp
      puts "Add the author's biography: "
      AddRemoveBooksController.authors_biography = gets.chomp
    end

    def ask_for_genres
      puts "Add a genre: "
      AddRemoveBooksController.genres_name = gets.chomp
    end

    def ask_for_tags
      puts "Add tags to the book: "
      AddRemoveBooksController.tags_name = gets.chomp
    end

    def ask_for_authors_count
      puts "How many authors does the book have?"
      AddRemoveBooksController.count = gets.chomp
    end

    def ask_for_tags_count
      puts "How many tags would you want to add?"
      AddRemoveBooksController.count = gets.chomp
    end

    def ask_for_genres_count
      puts "How many genres would you want to define for the book?"
      AddRemoveBooksController.count = gets.chomp
    end

  end
end