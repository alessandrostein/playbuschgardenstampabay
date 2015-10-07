class AddColumnTaskIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :task, index: true, foreign_key: true
  end
end
