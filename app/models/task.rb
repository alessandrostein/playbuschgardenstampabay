class Task < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :expires_on, :address, :city, :province, :country
end
