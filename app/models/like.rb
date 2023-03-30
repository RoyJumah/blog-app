class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_count(post_id)
    likes_count = where(post_id:).count
    post = Post.find(post_id)
    post.update(likes_count:)
  end
end
