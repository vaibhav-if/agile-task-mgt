class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_active, :boolean
    add_column :users, :is_admin, :boolean, :default => false
  end
end
