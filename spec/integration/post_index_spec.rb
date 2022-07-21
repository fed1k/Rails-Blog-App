require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before(:each) { visit user_posts_path(8) }
    it "can see the user's profile picture" do
      expect(page.find('#profile-avatar')['alt']).to eq('random image')
    end
    it "can see user's username" do
      user = User.first
      expect(page).to have_text(user.name)
    end
    it 'can see the number of posts the user has written' do
      user = User.first
      expect(page).to have_text(user.posts.count)
    end
    it "can see a post's title" do
      user = User.first
      user.posts.each do |i|
        expect(page).to have_text(i.title)
      end
    end
    it "can see some of the post's body" do
      user = User.first
      user.posts.each do |i|
        expect(page).to have_text(i.text)
      end
    end
    it 'can see a first comment on a post' do
      comment = Comment.create(id: 1, text: 'Good Night!', author_id: 8, post_id: 2)
      expect(page).to have_text(comment.text)
    end
    it 'can see how many comments a post has' do
      post = Post.first
      expect(page).to have_text(post.comments.count)
    end
    it 'can see how many likes a post has' do
      post = Post.first
      expect(page).to have_text(post.likes.count)
    end
    it "When I click on a post, it redirects me to that post's show page" do
      post = Post.first
      click_link "Post ##{post.id}: #{post.title}"
      expect(page).to have_current_path("/users/8/posts/#{post.id}")
    end
  end
end
