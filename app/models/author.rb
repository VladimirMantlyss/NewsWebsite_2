class Author < ApplicationRecord
  belongs_to :user
  has_many :post_and_authors
  has_many :posts, through: :post_and_authors
end
