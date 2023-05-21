class Commentar < ApplicationRecord
  belongs_to :user
  has_many :post_and_commentars
  has_many :posts, through: :post_and_commentars
end
