class SeedLtlocations < ActiveRecord::Migration
  def up
    # Front Side Oppos Rear
    # don't do N/A, which is implied if trees has null value
    Ltlocation.create(:name => 'Front')
    Ltlocation.create(:name => 'Side')
    Ltlocation.create(:name => 'Oppos')
    Ltlocation.create(:name => 'Rear')
  end

  def down
    Ltlocation.delete_all
  end
end
