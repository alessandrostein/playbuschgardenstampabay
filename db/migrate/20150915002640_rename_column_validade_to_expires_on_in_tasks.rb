class RenameColumnValidadeToExpiresOnInTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :validate, :expires_on
  end
end
