require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /searches' do
    before(:each) do
      @fake_user = User.create(
        name: 'Mr Test',
        email: 'test@test.com',
        password: '123123'
      )
      sign_in @fake_user
      get '/searches'
    end

    it 'returns an http success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('searches/index')
    end
  end
end
