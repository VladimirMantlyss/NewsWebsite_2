class Post < ApplicationRecord
  belongs_to :post_type
  has_many :post_and_authors, dependent: :destroy
  has_many :authors, through: :post_and_authors
  has_many :post_and_commentars
  has_many :commentars
  has_and_belongs_to_many :keywords, join_table: :keyword_and_posts


  def post_params
    params.require(:post).permit(:post_type_id, :title, :post_text, :author_id)
  end
end
