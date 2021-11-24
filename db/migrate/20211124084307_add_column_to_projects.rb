class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :status, :string
    add_column :projects, :user_id, :integer
    add_column :projects, :due_date, :datetime
    add_column :projects, :phase_id, :integer
  end
end
