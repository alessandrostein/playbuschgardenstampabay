class AddNewColumnStatusToActions < ActiveRecord::Migration
  def change
    add_column :actions, :status, :integer, default: 0
  end
end
