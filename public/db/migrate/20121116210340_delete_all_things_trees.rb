class DeleteAllThingsTrees < ActiveRecord::Migration
  def up
    Tree.delete_all
    Thing.delete_all
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
