class SeedRdlocations < ActiveRecord::Migration
  def up
    # Median Boulevard
    # don't do N/A, which is implied if trees has null value
    Rdlocation.create(:name => 'Median')
    Rdlocation.create(:name => 'Boulevard')
  end

  def down
    Rdlocation.delete_all
  end
end
