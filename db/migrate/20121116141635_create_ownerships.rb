class CreateOwnerships < ActiveRecord::Migration
  def change
  
    # ownerships lookup table
    # City Joint Private
    create_table :ownerships do |t|
      t.string :name
      t.timestamps
    end
    
  end
end
