class AddPostIdToCommentars < ActiveRecord::Migration[6.1]
  def change
    add_column :commentars, :post_id, :integer
  end
end
