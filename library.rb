require 'highline/import'
require './app/models/book'
require './app/models/user'
require './app/password_hash'
require './app/controllers/users_controller'
require './app/controllers/books_controller'
require './app/controllers/add_remove_books_controller'

puts "Welcome to the library. What do you want to do?"

User.create!(name: 'Ivan Ivanov',
             password: PasswordHash.createHash('12345678'),
             access: 'admin') unless User.find_by name: 'Ivan Ivanov'
UsersController.init_current_user
def ask_user
  choice = ""
  while(choice.empty?) do
    puts "     1) Find all books."
    puts "     2) Find a book's info by its isbn value."
    puts "     3) Sort all books by year of publishing or rating"
    puts "For logging in or logging out enter: "
    puts "     4) Log in."
    puts "     5) Log out."
    puts "If you are an administrator, you can: "
    puts "     6) Add a book to the database."
    puts "     7) Remove a book from the database."
    puts "     8) Add new user."
    puts "     9) Remove existing user."
    puts "For exit press 'e' "
    puts "-------------------------------------------------------"
    print "Your choice (number): "
    choice = gets.chomp
    system('clear')
  end

  case choice
    when "1" then BooksController.all_books
    when "2" then BooksController.find
    when "3" then BooksController.sort
    when "4" then UsersController.log_in
    when "5" then UsersController.log_out
    when "6" then AddRemoveBooksController.add_book
    when "7" then AddRemoveBooksController.remove_book
    when "8" then UsersController.add_user
    when "9" then UsersController.remove_user
    else exit
  end


  ask_user
end

ask_user