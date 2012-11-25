class Ward < ActiveRecord::Base
  attr_accessible :name, :city_ward_id
  has_many :trees
end
