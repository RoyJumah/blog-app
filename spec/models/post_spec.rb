require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'title should be present' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end


  it 'title should not be too long' do
    post = Post.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    post = Post.new(comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    post = Post.new(likes_counter: -1)
    expect(post).to_not be_valid
  end

  describe '#update_posts_counter' do
    it 'updates the post counter' do
      user = create(:user)
      create(:post, author: user)
      expect(user.post_counter).to eq(1)
    end
  end
end
