require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before(:each) { visit user_post_path(8, 1) }
    it "should see the post's title" do
      post = Post.first
      expect(page).to have_text(post.title.capitalize)
    end
    it 'should see who wrote the post' do
      user = User.first
      expect(page).to have_text(user.name)
    end
    it 'should see how many comments it has' do
      post = Post.first
      expect(page).to have_text(post.comments.count)
    end
    it 'should see how many likes it has' do
      post = Post.first
      expect(page).to have_text(post.likes.count)
    end
    it 'should see the post body' do
      post = Post.first
      expect(page).to have_text(post.text)
    end
    it 'see the username of each commentor' do
      post = Post.first
      user = User.find_by(id: post.comments.first.author_id)
      expect(page).to have_text(user.name)
    end
    it 'see the comment each commentor left' do
      post = Post.first
      post.comments.each do |i|
        p i.text
        expect(page).to have_text(i.text)
      end
    end
  end
end
