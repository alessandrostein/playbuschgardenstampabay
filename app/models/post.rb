class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :comments
  has_many :likes

  attr_accessible :text, :task_id, :user_id

  def liked?(user_id)
    self.likes.where(user_id: user_id).blank?
  end
end
