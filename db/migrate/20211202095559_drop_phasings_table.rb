class DropPhasingsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :phasings
  end
end
