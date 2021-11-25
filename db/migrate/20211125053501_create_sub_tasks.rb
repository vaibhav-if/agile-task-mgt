class CreateSubTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_tasks do |t|
      t.string :title, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
