class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :text

  def is_own?(user_id)
    self.user_id == user_id
  end
end
