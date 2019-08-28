class AddtitleToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :title, :string, null: false
  end
end
