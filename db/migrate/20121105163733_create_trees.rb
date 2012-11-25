class CreateTrees < ActiveRecord::Migration
  def change
  
    create_table :trees do |t|
      t.integer :thing_id # things
      t.integer :ward_id # wards
      t.integer :addnum
      t.string :addstr
      t.integer :ltlocation_id
      t.integer :rdlocation_id
      t.boolean :ownership # true=City false=Joint
      t.boolean :park # true=0 false=-1
      t.integer :species_id # species
      t.integer :dbh
      t.integer :treatment_id # treatments
      t.integer :treatment_tagnum # tag number associated with the injection program
      t.boolean :edible # whether or not this specific tree has fruit/nuts
      t.timestamps
    end
    
    # wards lookup table
    create_table :wards do |t|
      t.string :name
      t.integer :city_ward_id # the Ottawa ward id
      t.timestamps
    end
    
    # ltlocations lookup table
    # Front Side Oppos Rear N/A
    create_table :ltlocations do |t|
      t.string :name
      t.timestamps
    end
    
    # rdlocations lookup table
    # Median Boulevard N/A
    create_table :rdlocations do |t|
      t.string :name
      t.timestamps
    end
    
    # species lookup table
    create_table :species do |t|
      t.string :name
      t.boolean :edible # whether or not this species typically has fruit/nuts
      t.timestamps
    end
    
    # treatments lookup table
    # a tree may be involved in one injection program
    # EAB - Ash Trees
    # DED - Elm Trees (or DED1 and DED2; no records have just DED)
    create_table :treatments do |t|
      t.string :name
      t.timestamps
    end
    
    # TODO update Thing class (has_one :tree)
    
    # TODO add indices
    #add_index :trees, :ward_id
    #add_index :trees, :species_id
  
  end
end
