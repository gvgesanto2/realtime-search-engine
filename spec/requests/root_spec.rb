require 'rails_helper'

RSpec.describe 'Root', type: :request do
  describe 'GET /' do
    before(:each) { 
      @fake_user = User.create(
        name: 'Mr Test',
        email: 'test@test.com',
        password: '123123'
      )
      sign_in @fake_user
      get '/' 
    }

    it 'returns an http success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('articles/index')
    end
  end
end