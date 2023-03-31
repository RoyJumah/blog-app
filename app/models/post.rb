class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def update_posts_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_comments(num_comments = 5)
    comments.order(created_at: :desc).limit(num_comments)
  end
end
