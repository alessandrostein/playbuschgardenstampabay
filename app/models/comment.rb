class Comments < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  attr_accessible :text
end