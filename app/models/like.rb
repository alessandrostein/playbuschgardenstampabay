class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  attr_accessible :post_id, :user_id
end
