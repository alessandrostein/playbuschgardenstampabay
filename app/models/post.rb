class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  attr_accessible :text, :task_id, :user_id

  def liked?(user_id)
    self.likes.where(user_id: user_id).blank?
  end

  def post_is_own?(user_id)
    self.user.id == user_id
  end

  def self.total_posts
    Post.count
  end

end
