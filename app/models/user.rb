class User < ApplicationRecord
    has_many :comments, :likes, :posts
end
