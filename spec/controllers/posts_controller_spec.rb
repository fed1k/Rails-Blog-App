require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  fixtures :all
  describe 'GET #index' do
    let(:user) { users(:one) }
    it 'is a success' do
      get user_posts_path(user.id)
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      get user_posts_path(user.id)
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      get user_posts_path(user.id)
      expect(response.body).to include(user.name)
    end
  end
end
