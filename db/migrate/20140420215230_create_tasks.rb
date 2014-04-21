class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
    add_index :tasks, :status
  end
end
