class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean ,null: false,default: "0"
  end
end
