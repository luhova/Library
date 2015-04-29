require_relative "../../app/views/books_view"
require_relative "../spec_helper"
require_relative "../factories.rb"

describe BooksView do
  author1   = FactoryGirl.create(:author, name: "Sample Author1")
  author2   = FactoryGirl.create(:author, name: "Sample Author2")
  author3   = FactoryGirl.create(:author, name: "Sample Author3")
  tag       = FactoryGirl.create(:tag, name: "ruby")
  genre     = FactoryGirl.create(:genre, name: "testing")
  publisher = FactoryGirl.create(:publisher, name: "ciela")
  let!(:book1) { FactoryGirl.create(:book, authors: [author1],
                                           tags: [tag],
                                           genres: [genre],
                                           publisher: publisher,
                                           title: "Sample Book1",
                                           year: 2015,
                                           isbn: 123456,
                                           rating: 10,
                                           description: "A book for tdd.") }
  let!(:book2) { FactoryGirl.create(:book, authors: [author2],
                                           tags: [tag],
                                           genres: [genre],
                                           publisher: publisher,
                                           title: "Sample Book2",
                                           year: 2014,
                                           isbn: 123457,
                                           rating: 7,
                                           description: "A book for ruby.") }
  let!(:book3) { FactoryGirl.create(:book, authors: [author3],
                                           tags: [tag],
                                           genres: [genre],
                                           publisher: publisher,
                                           title: "Sample Book3",
                                           year: 2013,
                                           isbn: 123458,
                                           rating: 8) }
  describe '.display_books' do
    context 'with several books in the library' do
      it "prints the right information for every book" do
        expect { BooksView.display_books([book1, book2, book3]) }.to output("Title: Sample Book1 - Name of the author/s: Sample Author1 - Genres: testing - ISBN: 123456 \nTitle: Sample Book2 - Name of the author/s: Sample Author2 - Genres: testing - ISBN: 123457 \nTitle: Sample Book3 - Name of the author/s: Sample Author3 - Genres: testing - ISBN: 123458 \n").to_stdout
      end
    end
    context 'with no books in the library' do
      it "prints the right message when there aren't any books yet" do
        expect{ BooksView.display_books([]) }.to output("There aren't any books in the library yet\n").to_stdout
      end
    end
  end

  describe '.display_book' do
    it "prints the right information for a specific book" do
      expect { BooksView.display_book(book1) }.to output("Title: Sample Book1 - Name of the author/s: Sample Author1 - Description: A book for tdd. - Year of publishing: 2015 - Rating: 10 - Genres: testing - ISBN: 123456").to_stdout

      expect { BooksView.display_book(book2) }.to output("Title: Sample Book2 - Name of the author/s: Sample Author2 - Description: A book for ruby. - Year of publishing: 2014 - Rating: 7 - Genres: testing - ISBN: 123457").to_stdout
    end
  end
end