class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :description, limit: 1000, null: false

      t.timestamps
    end
  end
end
