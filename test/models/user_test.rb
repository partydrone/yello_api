require "test_helper"

describe User do
  subject { User.new }

  it "has a pseudonym" do
    _(subject).must_respond_to :pseudonym
  end

  # it "does not allow anonymous pseudonym" do
  #   subject.pseudonym = "Anonymous"

  #   _(subject).wont_be :valid?
  # end

  it "has a username" do
    _(subject).must_respond_to :username
  end

  it "has a password" do
    _(subject).must_respond_to :password
  end

  it "has a password confirmation" do
    _(subject).must_respond_to :password_confirmation
  end
end
