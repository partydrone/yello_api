require "test_helper"

describe Book do
  subject { Book.new }

  it "has a title" do
    _(subject).must_respond_to :title
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
end
