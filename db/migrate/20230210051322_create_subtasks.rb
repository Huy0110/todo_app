class CreateSubtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :subtasks do |t|
      t.string :description
      t.boolean :completed
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
