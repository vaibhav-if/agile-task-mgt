class RemovePhaseFsFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :phases, :string
  end
end
