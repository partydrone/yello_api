require "test_helper"

describe Book do
  subject { Book.new }

  it "has a title" do
    _(subject).must_respond_to :title
  end

  it "can search by title" do
    books = Book.search("one")

    books.each do |book|
      _(book.title).must_match /one/i
    end
  end

  it "has a description" do
    _(subject).must_respond_to :description
  end

  it "has an author" do
    _(subject).must_respond_to :author
  end

  it "has a cover image" do
    _(subject).must_respond_to :cover
  end

  it "has a price" do
    _(subject).must_respond_to :price
  end

  it "has an unpublished date" do
    _(subject).must_respond_to :unpublished_at
  end

  it "unpublishes itself" do
    book = Book.create!(
      title: "Temp Book",
      description: "This book will be unpublished.",
      author: User.create!(pseudonym: "Unpublished Author"),
      price: 12.99
    )

    _(book.unpublished_at).must_be_nil

    book.unpublish!
    book.reload

    _(book.unpublished_at).wont_be_nil
  end
end
