class CreatePostAndAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :post_and_authors do |t|
      t.references :post, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
