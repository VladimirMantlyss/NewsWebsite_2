class Commentar < ApplicationRecord

  attribute :commentar_text, :string

  belongs_to :user
  belongs_to :post
  has_many :post_and_commentars, class_name: 'PostAndCommentar'
  has_many :posts, through: :post_and_commentars

  validates :content, presence: true
end
