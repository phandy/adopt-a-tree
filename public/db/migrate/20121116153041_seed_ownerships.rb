class SeedOwnerships < ActiveRecord::Migration
  def up
    # City Joint Private
    Ownership.create(:name => 'City')
    Ownership.create(:name => 'Joint')
    Ownership.create(:name => 'Private')
  end

  def down
    Ownership.delete_all
  end
end
