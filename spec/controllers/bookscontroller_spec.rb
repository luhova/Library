require "../spec_helper"
require "../factories.rb"
require "../../app/models/book"
require "../../app/views/books_view"

describe BooksController do

  author    = FactoryGirl.create(:author)
  tag       = FactoryGirl.create(:tag)
  genre     = FactoryGirl.create(:genre)
  publisher = FactoryGirl.create(:publisher)
  let!(:book1) { FactoryGirl.create(:book, authors: [author],
                                           tags: [tag],
                                           genres: [genre],
                                           year: 2015,
                                           isbn: 123456,
                                           rating: 10) }
  let!(:book2) { FactoryGirl.create(:book, authors: [author],
                                           tags: [tag],
                                           genres: [genre],
                                           year: 2014,
                                           isbn: 123457,
                                           rating: 7) }
  let!(:book3) { FactoryGirl.create(:book, authors: [author],
                                           tags: [tag],
                                           genres: [genre],
                                           year: 2013,
                                           isbn: 123458,
                                           rating: 8) }

  describe '.find' do
    it 'finds the right book by its isbn' do
      expect(Book.find_by isbn:123457).to eq(book2)
    end
  end

end