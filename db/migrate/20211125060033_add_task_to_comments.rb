class AddTaskToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :task, null: false, foreign_key: true
  end
end
