class Tree < ActiveRecord::Base
  attr_accessible :ward_id, :addnum, :addstr, :ltlocation_id, :rdlocation_id, :ownership_id, :park, :species_id, :dbh, :treatment_id, :treatment_tagnum, :edible
  belongs_to :thing
  belongs_to :ward
  belongs_to :ltlocation
  belongs_to :rdlocation
  belongs_to :species
  belongs_to :treatment
  belongs_to :ownership
end
