class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: first_user, title: 'Whats up', text: 'This is my second post')
  Post.create(author: first_user, title: 'Yeeey', text: 'This is my third post')
  Post.create(author: first_user, title: 'Salam', text: 'This is my fourth post')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom!')
  Comment.create(post: first_post, author: first_user, text: 'Whats up man!')
  Comment.create(post: first_post, author: first_user, text: 'I hope you are doing good')
  Comment.create(post: first_post, author: first_user, text: 'I need some help')
  Comment.create(post: first_post, author: first_user, text: 'I really appreciate it')
  Comment.create(post: first_post, author: first_user, text: 'Thanks bro')

  def three_recent_posts
    Post.all.order(created_at: :desc).limit(3)
  end
end
