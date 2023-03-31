require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'John Doe') }
  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    user.post_counter = -1
    expect(user).to_not be_valid
  end

  describe '#most_recent_posts' do
    it 'returns the most recent posts' do
      post1 = create(:post, created_at: 1.day.ago)
      post2 = create(:post, created_at: 1.hour.ago)
      post3 = create(:post, created_at: 1.minute.ago)

      expect(user.most_recent_posts).to eq([post3, post2, post1])
    end
  end
end
