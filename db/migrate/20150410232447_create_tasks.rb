class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.integer :task_list_id, null: false
      t.boolean :complete, null: false, default: true
      t.text :description
      t.date :date_completed

      t.timestamps
    end
  end
end
