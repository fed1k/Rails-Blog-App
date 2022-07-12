require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is a success' do
      get user_posts_path(1)
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      get user_posts_path(1)
      expect(response.body).to include('Posts for a User')
    end
  end
end
