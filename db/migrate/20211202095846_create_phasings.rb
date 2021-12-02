class CreatePhasings < ActiveRecord::Migration[6.1]
  def change
    create_table :phasings do |t|
      t.references :project, null: false, foreign_key: true
      t.references :phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
