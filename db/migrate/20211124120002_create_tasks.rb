class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :decription, limit: 500
      t.datetime :start_date
      t.datetime :end_date
      t.float :story_point, null: false
      t.string :priority, null: false
      t.datetime :due_date, null: false
      t.string :status, null: false
      t.string :task_type, default: "Task"

      t.timestamps
    end
  end
end
