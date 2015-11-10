class AddClassifierToComment < ActiveRecord::Migration
  def change
    add_column :comments, :classifier, :integer
  end
end
