class Post < ApplicationRecord
<<<<<<< HEAD
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
=======
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :likes
>>>>>>> d7db6f5107eb143d4533bb5fb8da15add1779a40
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_create :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
