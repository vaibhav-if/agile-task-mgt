class AddPhaseToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :phases, :string, null: false
  end
end
