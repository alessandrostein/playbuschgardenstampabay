class AddTitleToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string, limit: 50
  end
end
