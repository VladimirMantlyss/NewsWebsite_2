class PostType < ApplicationRecord
  self.inheritance_column = 'custom_type'
  has_many :posts
end
