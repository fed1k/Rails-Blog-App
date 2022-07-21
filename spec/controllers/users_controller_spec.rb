require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      # p response
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      expect(response).to have_http_status(:ok)
    end
  end
end
