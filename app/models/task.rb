class Task < ActiveRecord::Base
  attr_accessible :description, :expires_on, :address, :city, :province, :country
end
