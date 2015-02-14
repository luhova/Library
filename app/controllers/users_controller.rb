require_relative '../models/user'
require_relative '../password_hash'
require_relative '../views/users_view'


class UsersController
  include PasswordHash

  @@current_user = User.find_by name: 'Ivan Ivanov'

  class << self
    attr_accessor  :user_name, :user_password, :user_access

    def log_in
      if @@current_user
        puts 'Someone is already logged in. Please log out first.'
      else
        UsersView.ask_for_name
        UsersView.ask_for_password
        user = User.find_by name: @user_name
        password_hash = PasswordHash.createHash(@user_password)
        if user && PasswordHash.validatePassword(password_hash, user.password)
          @@current_user = user
        else
          raise 'Wrong name or password'
        end
      end
    end

    def log_out
      if @@current_user
        @@current_user = nil
      else
        puts 'You must be logged in in order to log out'
      end
    end

   def add_user
    message = 'You do not have permission to perform this action'
    puts message unless @@current_user.access == 'admin'
    UsersView.ask_for_name
    UsersView.ask_for_password
    UsersView.ask_for_access
    @password_hash = PasswordHash.createHash(@user_password)
    User.create(
      :name => @user_name,
      :password => @password_hash,
      :access => @user_access
      )
   end

   def remove_user
    message = 'You do not have permission to perform this action'
    puts message unless @current_user.access == 'admin'
    UsersView.ask_for_name
    user_to_remove = User.find_by name: @user_name
    user_to_remove.destroy
   end
  end
end