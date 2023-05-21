class CreatePostAndCommentars < ActiveRecord::Migration[7.0]
  def change
    create_table :post_and_commentars do |t|
      t.references :post, null: false, foreign_key: true
      t.references :commentar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
