class Task < ActiveRecord::Base
  belongs_to :user
  has_many :actions
  has_many :posts

  attr_accessible :description, :expires_on, :address, :city, :province, :country

  scope :actions_requiring_approval, ->(){
    joins(:actions).where('actions.status = 0')
  }

end
