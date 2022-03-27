require "test_helper"

describe User do
  subject { User.new }

  it "has a pseudonym" do
    _(subject).must_respond_to :pseudonym
  end

  it "does not allow anonymous pseudonym" do
    subject.pseudonym = "Anonymous"

    _(subject).wont_be :valid?
  end
end
