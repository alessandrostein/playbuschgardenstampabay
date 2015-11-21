class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :presence => true

  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :actions

  scope :top_10_in_points, -> { joins(:sashes) }

  def is_in_action?(task_id)
    self.actions.where(task_id: task_id).present?
  end

  def is_in_action_pending?(task_id)
    self.actions.where(status: 0, task_id: task_id).present?
  end

  def is_in_action_requiring_approval?(task_id)
    self.actions.where(status: 1, task_id: task_id).present?
  end

  def is_in_action_approved?(task_id)
    self.actions.where(status: 2, task_id: task_id).present?
  end

  def self.total_users
    User.count
  end

  def total_wins
    Merit::ActivityLog.where("action_id in (select id from merit_actions where user_id = '#{self.id}')").count
  end

end
