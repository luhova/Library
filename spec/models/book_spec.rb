require_relative "../../app/models/book"
require_relative "../spec_helper"
require_relative "../factories.rb"


describe Book do
  context 'with several books in db' do

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

    it "requires a title to be present" do
      expect(Book.create(title:nil).valid?).to be false
    end

    it "requires an isbn to be present" do
      expect(Book.create(isbn:nil).valid?).to be false
    end

    it "requires an isbn to be unique" do
      expect { FactoryGirl.create(:book, authors: [author],
                                         tags: [tag],
                                         genres: [genre],
                                         isbn:123456)}.to raise_error
    end

    it "requires the isbn length to be in range of 6-20 symbols" do
     expect(Book.create(title: "Sample book", isbn: 123567)).to be_truthy
     expect(Book.create(title: "Sample bok", isbn: 12).valid?).to be false
    end

    it "responds to authors" do
      expect(book1).to respond_to(:authors)
    end

    it "responds to publisher" do
      expect(book1).to respond_to(:publisher)
    end

    it "responds to tags" do
      expect(book1).to respond_to(:tags)
    end

    it "responds to genres" do
      expect(book1).to respond_to(:genres)
    end

    describe '.sort' do
      it "sorts the book in the right way" do
        expect(Book.sort_books("1").all).to eq([book1, book2, book3])
        expect(Book.sort_books("2").all).to eq([book1, book3, book2])
      end
    end
  end

  context 'with no books in db' do
    describe ".all" do
      it "has the exact number of books" do
        expect(Book.all.count).to eq(0)
      end
    end
  end
end