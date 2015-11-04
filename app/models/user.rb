class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

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

    #:merit_score_points).select("users.*").
    #group('merit_score_points.score_id, users.score_id').order("sum(merit_score_points.merit_score_points) DESC").limit(25) }

end
