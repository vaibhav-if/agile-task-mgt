class RemoveUserIdAndPhaseIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :user_id, :integer
    remove_column :projects, :phase_id, :integer
  end
end
