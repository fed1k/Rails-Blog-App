class Post < ApplicationRecord
  belongs_to :users
  belongs_to :comments
  belongs_to :likes
end
