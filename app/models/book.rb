class Book < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_one_attached :cover
end
