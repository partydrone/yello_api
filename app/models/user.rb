class User < ApplicationRecord
  has_secure_password

  # validate :pseudonym_is_not_anonymous

  private

  def pseudonym_is_not_anonymous
    errors.add(:pseudonym, "can't be anonymous") if pseudonym.match?(/anonymous/i)
  end
end
