class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :body, null: false
      t.datetime :lasttask, null: false
      t.integer :priority, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
