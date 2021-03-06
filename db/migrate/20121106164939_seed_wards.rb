class SeedWards < ActiveRecord::Migration
  def up
    # rake "invalid multibyte char (US-ASCII)" for Orleans with accented e
    Ward.create(:city_ward_id => 1, :name => 'Orleans')
    Ward.create(:city_ward_id => 2, :name => 'Innes')
    Ward.create(:city_ward_id => 3, :name => 'Barrhaven')
    Ward.create(:city_ward_id => 4, :name => 'Kanata North')
    Ward.create(:city_ward_id => 5, :name => 'West Carleton-March')
    Ward.create(:city_ward_id => 6, :name => 'Stittsville')
    Ward.create(:city_ward_id => 7, :name => 'Bay')
    Ward.create(:city_ward_id => 8, :name => 'College')
    Ward.create(:city_ward_id => 9, :name => 'Knoxdale-Merivale')
    Ward.create(:city_ward_id => 10, :name => 'Gloucester-Southgate')
    Ward.create(:city_ward_id => 11, :name => 'Beacon Hill-Cyrville')
    Ward.create(:city_ward_id => 12, :name => 'Rideau-Vanier')
    Ward.create(:city_ward_id => 13, :name => 'Rideau-Rockcliffe')
    Ward.create(:city_ward_id => 14, :name => 'Somerset')
    Ward.create(:city_ward_id => 15, :name => 'Kitchissippi')
    Ward.create(:city_ward_id => 16, :name => 'River')
    Ward.create(:city_ward_id => 17, :name => 'Capital')
    Ward.create(:city_ward_id => 18, :name => 'Alta Vista')
    Ward.create(:city_ward_id => 19, :name => 'Cumberland')
    Ward.create(:city_ward_id => 20, :name => 'Osgoode')
    Ward.create(:city_ward_id => 21, :name => 'Rideau-Goulbourn')
    Ward.create(:city_ward_id => 22, :name => 'Gloucester-South Nepean')
    Ward.create(:city_ward_id => 23, :name => 'Kanata South')
  end
  
  def down
    Ward.delete_all
  end
end
