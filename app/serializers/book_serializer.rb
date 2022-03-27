class BookSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :cover_url, :price, :created_at, :updated_at
  belongs_to :author

  def cover_url
    rails_blob_path(object.cover) if object.cover.attached?
  end
end
