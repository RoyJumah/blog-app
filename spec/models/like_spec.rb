require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    it 'updates the likes counter' do
      user = create(:user)
      post = create(:post, author: user)
      create(:like, author: user, post:)
      expect(post.likes_counter).to eq(1)
    end
  end
end
