class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :name
      t.boolean :completed

      t.timestamps
    end
  end
end
