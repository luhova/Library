require_relative '../../establish_connection'

class User < ActiveRecord::Base
  validates :name, :password, :access, presence: true
  validates :password, length: { :minimum => 8 }
end