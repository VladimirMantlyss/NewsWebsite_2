class PostType < ApplicationRecord
  self.inheritance_column = :category
end
