class AddTaskToAttachment < ActiveRecord::Migration[6.1]
  def change
    add_reference :attachments, :task, null: false, foreign_key: true
  end
end
