class Species < ActiveRecord::Base
  attr_accessible :name, :edible
  has_many :trees
end
