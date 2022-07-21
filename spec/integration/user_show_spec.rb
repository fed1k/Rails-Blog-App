require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'show page' do
    before(:each) { visit user_path(8) }
    it 'can see profile picture for each user' do
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
    it "can see the user's bio" do
      user = User.first
      expect(page).to have_text(user.bio)
    end
    it "should see user's three posts" do
      user = User.first
      user.posts.limit(3).each do |i|
        expect(page).to have_text(i.text)
      end
    end
    it 'can see a button that lets see all the posts' do
      expect(page).to have_text('See all posts')
    end
    it "When I click a user's post, it redirects me to that post's show page" do
      user = User.first
      user.posts.each do |i|
        click_link "Post ##{i.id}"
        expect(page).to have_current_path("/users/#{user.id}/posts/#{i.id}")
      end
    end
    it "When I click to see all posts, it redirects me to the user's post's index page" do
      user = User.first
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{user.id}/posts")
    end
  end
end
