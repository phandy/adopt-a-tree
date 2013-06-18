class AddFruitNutsToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.boolean :fruitnuts_contact, :default => true
    end
    User.update_all ["fruitnuts_contact = ?", true]
  end
  
  def down
    remove_column :users, :fruitnuts_contact
  end
end
