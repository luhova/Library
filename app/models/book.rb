require_relative '../establish_connection'

class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :genres
  belongs_to :publisher

  validates :title, :isbn, presence: true
  validates :isbn, length: { in: 6..20 }, uniqueness: true

  class << self
    def sort_books(option)
      if(option == "1")
        Book.order(year: :desc)
      else
        Book.order(rating: :desc)
      end
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