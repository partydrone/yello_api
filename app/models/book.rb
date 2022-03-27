class Book < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one_attached :cover

  def unpublish!
    update!(unpublished_at: Time.current)
  end
end
