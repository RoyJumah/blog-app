require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comments_counter' do
    it 'updates the post comments counter' do
      user = create(:user)
      post = create(:post, author: user)
      create(:comment, author: user, post:)
      expect(post.comments_counter).to eq(1)
    end
  end
end
