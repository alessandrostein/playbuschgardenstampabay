class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  enum status: [ :pending, :waiting_accepted, :accept ]

  attr_accessible :status, :task_id

  scope :actions_requiring_approval, ->(tasks){
    where('actions.status = 1 and actions.task_id in (?)', tasks)
  }
end

SELECT "actions".* FROM "actions" WHERE (status = 1 and task_id in (SELECT "tasks"."id" FROM "tasks" WHERE "tasks"."user_id" = 1))
