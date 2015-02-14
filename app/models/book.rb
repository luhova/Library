require_relative '../establish_connection'

class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :genres
  belongs_to :publisher

  validates :title, :isbn, presence: true
  validates :isbn, length: { in: 6..20 }

  class << self
    def all_books
      Book.find_each do |book|
        print "Title: #{book.title} "
        print "Name of the author/s: "
        book.authors.each do |author|
          print "#{author.name} "
        end
        print "Name of the genres: "
        book.genres.each do |genre|
          print  "#{genre.name} "
        end
        print "ISBN: #{book.isbn}"
        puts " "
      end
    end

    def display_book(book)
      print "Title: #{book.title} "
      print "Name of the author/s: "
      book.authors.each do |author|
        print "#{author.name} "
      end
      print "Discription: #{book.discription}"
      print "Year of publishing: #{book.year}"
      print "Rating: #{book.rating}"
      print "Name of the genress: "
      book.genres.each do |genre|
        print  "#{genre.name} "
      end
      print "ISBN: #{book.isbn}"
    end
  end
end

class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Genre < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Publisher < ActiveRecord::Base
  has_many :books
end