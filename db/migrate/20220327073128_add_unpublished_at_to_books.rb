class AddUnpublishedAtToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :unpublished_at, :datetime
  end
end
