class AddRemoveTreesOwnership < ActiveRecord::Migration
  def up
    add_column :trees, :ownership_id, :integer
    remove_column :trees, :ownership
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
