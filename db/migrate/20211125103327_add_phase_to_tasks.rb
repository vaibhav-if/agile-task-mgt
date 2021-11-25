class AddPhaseToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :phase, null: false, foreign_key: true
  end
end
