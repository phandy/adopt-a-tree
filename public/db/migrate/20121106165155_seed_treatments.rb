class SeedTreatments < ActiveRecord::Migration
  def up
    # DED1 DED2 EAB (DED ?)
    Treatment.create(:name => 'DED1')
    Treatment.create(:name => 'DED2')
    Treatment.create(:name => 'EAB')
  end

  def down
    Treatment.delete_all
  end
end
