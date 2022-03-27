class UserSerializer < ApplicationSerializer
  attributes :id, :pseudonym
  has_many :books
end
