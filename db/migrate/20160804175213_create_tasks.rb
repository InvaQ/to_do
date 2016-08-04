class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :completed_at
      t.integer :priority
      t.integer :list_id

      t.timestamps
    end
  end
end
