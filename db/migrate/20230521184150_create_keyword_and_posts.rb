class CreateKeywordAndPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :keyword_and_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :keyword, null: false, foreign_key: true

      t.timestamps
    end
  end
end
