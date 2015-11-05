class Task < ActiveRecord::Base
  belongs_to :user
  has_many :actions
  has_many :posts

  attr_accessible :title, :description, :expires_on, :address, :city, :province, :country

  scope :actions_requiring_approval, ->(){
    joins(:actions).where('actions.status = 0')
  }

  def task_is_own?(user_id)
    self.user.id == user_id
  end

  def total_with_action_pending
    self.actions.where(status: 0).count
  end

  def total_with_action_waiting
    self.actions.where(status: 1).count
  end

  def total_with_action_termimated
    self.actions.where(status: 2).count
  end

end
