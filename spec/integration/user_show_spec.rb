require 'rails_helper'

RSpec.describe 'Users', type: :system do
    describe 'show page' do
      before(:each) {visit user_path(8)}
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
    end
end
