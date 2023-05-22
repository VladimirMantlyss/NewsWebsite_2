class Commentar < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates :commentar_text, presence: true
end
