class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  enum classifier: [ :good, :bad ]

  attr_accessible :text, :user_id, :post_id, :parent_id

  acts_as_tree order: 'created_at DESC'
end
