class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :due_date, :date
  end
end
