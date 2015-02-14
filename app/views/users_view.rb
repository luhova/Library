require 'colorize'
require 'highline/import'
require_relative '../controllers/users_controller'

class UsersView
  class << self

    def ask_for_name
      puts "name: "
      UsersController.user_name = gets.chomp
    end

    def ask_for_password
      UsersController.user_password = ask("password: ") {|q| q.echo = false}
    end

    def ask_for_access
      puts "access: "
      UsersController.user_access = gets.chomp
    end
  end
end