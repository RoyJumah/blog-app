class User < ApplicationRecord
<<<<<<< HEAD
  has_many :posts, foreign_key: :user_id, class_name: 'Post'
  has_many :comments, foreign_key: :user_id, class_name: 'Comment'
  has_many :likes, foreign_key: :user_id, class_name: 'Like'
=======
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
>>>>>>> d7db6f5107eb143d4533bb5fb8da15add1779a40

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
