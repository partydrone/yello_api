require "test_helper"

describe User do
  subject { User.new }

  it "has a pseudonym" do
    _(subject).must_respond_to :pseudonym
  end
end
