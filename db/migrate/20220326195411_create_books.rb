class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
