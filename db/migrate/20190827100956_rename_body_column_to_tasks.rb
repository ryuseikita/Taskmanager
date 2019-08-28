class RenameBodyColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :body, :details
  end
end
