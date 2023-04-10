require 'rails_helper'

RSpec.feature 'PostsIndices', type: :feature do
  describe 'user image' do
    it 'should display the correct image' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      visit "/users/#{user.id}/posts"
      expect(page).to have_css("img[src*='https://i.imgur.com/8Qq7YQq.jpg']")
    end
  end

  describe 'user name' do
    it 'should display the username' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('Example User')
    end
  end

  describe 'user posts' do
    it 'should display the number of posts a user has' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('1')
    end
  end


  # let!(:user) { User.create(name: "Example User", bio: "Example Bio", photo: "https://i.imgur.com/8Qq7YQq.jpg") }

  #   before do
  #     visit users_path
  #   end
  # describe 'click on user' do
  #   it "takes you to the user's show page" do
  #     click_link user.name
  #     expect(page).to have_current_path(user_path(user))
  #   end
  # end

  describe 'post title' do
    it 'should display the post title' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('Example Title')
    end
  end

  describe 'post text' do
    it 'should display the post text' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('Example Text')
    end
  end

  describe 'show first comment' do
    it 'should display the first comment' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      Comment.create(text: 'Example Comment', post_id: post.id, author_id: user.id)
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('Example Comment')
    end
  end

  describe 'how many comments' do
    it 'should display the number of comments' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      Comment.create(text: 'Example Comment', post_id: post.id, author_id: user.id)
      visit "/users/#{user.id}/posts/"
      expect(page).to have_content('1')
    end
  end

  describe 'how many likes' do
    it 'should display the number of likes' do
      user = User.create(name: 'Example User', bio: 'Example Bio', photo: 'https://i.imgur.com/8Qq7YQq.jpg')
      Post.create(title: 'Example Title', text: 'Example Text', author_id: user.id)
      Like.create(post_id: post.id, author_id: user.id)

      visit "/users/#{user.id}/posts"
      expect(page).to have_text('1')
    end
  end
end
