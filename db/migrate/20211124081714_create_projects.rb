class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title, :null => false
      t.text :description, :limit => 500

      t.timestamps
    end
  end
end
