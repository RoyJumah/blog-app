require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list posts') do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      response(200, 'successful') do
        let(:user_id) { User.first.id }
        run_test!
      end
      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end
end
