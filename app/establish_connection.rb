require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'D:/SU/2/Ruby/Library/db/library.sqlite3'
  )