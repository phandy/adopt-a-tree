class RemoveTreeIdColumn < ActiveRecord::Migration
  def change
    remove_column :things, :tree_id
  end
end
