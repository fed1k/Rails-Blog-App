require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before(:each) { visit users_path }
    it 'shows the right content' do
      User.all.each do |i|
        expect(page).to have_content(i.name)
      end
    end
    it 'shows the number of posts each user has written' do
      expect(page).to have_content(Post.all.count)
    end
    it 'when user is clicked, it should be redirected to user show page' do
      User.all.each do |i|
        click_link i.name
        expect(page).to have_current_path("/users/#{i.id}")
      end
    end
    it 'can see profile picture for each user' do
      User.all.each do |_i|
        expect(page.find('#profile-avatar')['alt']).to eq('random image')
      end
    end
  end
end
