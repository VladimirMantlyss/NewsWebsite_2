class CreateCommentars < ActiveRecord::Migration[7.0]
  def change
    create_table :commentars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :commentar_text
      t.datetime :commentar_date

      t.timestamps
    end
  end
end
