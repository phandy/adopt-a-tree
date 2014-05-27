class AddOneToOneAssociationTreesThings < ActiveRecord::Migration
  def change
    add_column :things, :tree_id, :integer
  end
end
