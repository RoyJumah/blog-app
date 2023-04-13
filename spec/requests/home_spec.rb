require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /header' do
    it 'returns http success' do
      get '/home/header'
      expect(response).to have_http_status(:success)
    end
  end
end
