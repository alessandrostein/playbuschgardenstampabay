class CreateTableActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.timestamps null: false
    end
    
    add_reference :actions, :task, index: true, foreign_key: true
    add_reference :actions, :user, index: true, foreign_key: true
  end
end
