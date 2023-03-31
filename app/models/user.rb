class User < ApplicationRecord

validates :name, presence: true
validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
   
  end
end
