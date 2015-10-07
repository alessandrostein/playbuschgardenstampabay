class Task < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  attr_accessible :description, :expires_on, :address, :city, :province, :country
end
