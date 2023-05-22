class Keyword < ApplicationRecord
  has_and_belongs_to_many :posts, join_table: :keyword_and_posts
end
