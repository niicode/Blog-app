class User < ActiveRecord::Base
  has_one :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_three_posts
    posts.last(3)
  end
end
